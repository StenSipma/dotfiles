import pynvim
from astropy.io import fits


@pynvim.plugin
class FitsOpener(object):
    def __init__(self, nvim):
        self.nvim = nvim

    @pynvim.command('FITSPreview', nargs=1, complete='file', sync=True)
    def fits_preview_handler(self, args):
        # Read file
        try:
            with fits.open(args[0]) as hdul:
                headers = hdul[0].header
        except OSError as e:
            if "Header missing END card." in e.args:
                self.nvim.api.err_writeln(f"File '{args[0]}' is not a valid FITS file")
            else:
                self.nvim.api.err_writeln(f"File '{args[0]}' is not a file")
            return

        # buf = self.nvim.current.buffer
        win = self.nvim.current.window

        # Prepare the buffer
        win_height = win.height
        win_width = win.width

        newbuf = self.nvim.api.create_buf(True, True)

        # Add headers to the buffer
        table, w, h = draw_fancy_table(list(headers.items()),
                                       ret_width_height=True)
        newbuf.append(table)
        config = {"relative": "win", "win": win.number, "width": w,
                  "height": win_height-4, "col": win_width-w - 4, "row": 2,
                  "style": "minimal"}

        # Actually spawn the window
        newwin = self.nvim.api.open_win(newbuf, True, config)
        self.nvim.out_write(f"Window {newwin}\n")
        self.nvim.api.del_current_line()


# lines:
VERTICAL = 0
HORIZONTAL = 1
# corners:
NW = 0
NE = 1
SE = 2
SW = 3
# crossings:
MIDDLE = 0
LEFT = 1
RIGHT = 2
UP = 3
DOWN = 4


def pad(string, n=1, padstr=" "):
    return padstr*n + string + padstr*n


def transpose(data):
    return [[row[col] for row in data] for col in range(len(data[0]))]


def replace(string, indices, chars):
    # make sure negative numbers are made positive (by adding len(string))
    # indices have to be sorted, so -1 should be towards the end.
    N = len(string)
    indices = [i + N if i < 0 else i for i in indices]
    newstr = ""
    prev = 0
    for idx, ch in zip(indices, chars):
        newstr += string[prev:idx] + ch
        prev = idx+1
    return newstr + string[prev:]


def draw_fancy_table(data, rows=True, lines="│─", corners="┌┐┘└",
                     crossings="┼├┤┬┴", align="<", ret_width_height=False):
    """
    lines:
        0 - VERTICAL
        1 - HORIZONTAL
    corners:
        0 - NW
        1 - NE
        2 - SE
        3 - SW
    crossings:
        0 - MIDDLE
        1 - LEFT
        2 - RIGHT
        3 - UP
        4 - DOWN
    """
    if len(data) < 1:
        raise ValueError("Data should now be empty")
    if rows:  # transpose to columns
        data = transpose(data)
    if len(align) == 1:
        align *= len(data)
    widths = [max(col, key=lambda c: len(str(c))) for col in data]
    widths = [len(w) if isinstance(w, str) else w for w in widths]

    vline = lines[VERTICAL]
    row_fmt = pad(vline).join(["{:"+al+str(width)+"}" for al, width in zip(align, widths)])
    row_fmt = vline + " " + row_fmt + " " + vline

    top_row = lines[HORIZONTAL]*(sum(widths) + 3*(len(widths)-1) + 2*2)
    bot_row = top_row[:]  # copy

    top_row = replace(top_row, [0, -1], [corners[NW], corners[NE]])
    bot_row = replace(bot_row, [0, -1], [corners[SW], corners[SE]])
    # TODO find crossings

    data = transpose(data)
    rowstrs = [row_fmt.format(*row) for row in data]

    table = [top_row] + rowstrs + [bot_row]
    if ret_width_height:
        return table, len(table[0]), len(table)
    return table

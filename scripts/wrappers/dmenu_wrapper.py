#!/bin/python3

# Reads a list from STDIN to start dmenu
#

# Input example:
"""
Option 1
Return for Option 1
Option 2
Return for Option 2
...
Option N
Return for Option N
"""

from sys import stdin
import subprocess as sp

def read_input():
    all_lines = list(map(lambda l: l.strip(), stdin.readlines()))
    opt_ret_dict = {}
    for line in zip(all_lines[::2], all_lines[1::2]):
        if line is not None:
            opt_ret_dict[line[0]] = line[1]
    return opt_ret_dict

in_dict = read_input()
instr = '\n'.join(in_dict.keys())
#command = ["dmenu"]
command_rofi = ["rofi", "-dmenu", "-only-match", "-theme", "Arc-Dark-Custom"]
out = sp.run(command_rofi, capture_output=True, text=True, input=instr)
print(in_dict[out.stdout.strip()])

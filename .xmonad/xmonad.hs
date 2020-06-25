-- Import Statements
import XMonad

-- Config
import XMonad.Config.Desktop

-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.InsertPosition

-- Layout
import XMonad.ManageHook
import qualified XMonad.StackSet as W

-- Util
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.EZConfig (additionalKeys)

import System.IO


-- Colours
myBackgroundColour      = "#2f343f"
myLightBackgroundColour = "#69748C"
-- text
myTextColour            = "#f3f4f5"
myAlternateTextColour   = "#C8CDDE"
myFocusedTextColour     = myTextColour
myInactiveTextColour    = "#676E7D"
-- border
myNormalBorderColor     = "#666666"
myFocusedBorderColor    = "#DEDEDE"

-- Variables
myTerminal           = "st"
myModMask            = mod4Mask
myBorderWidth        = 2

-- Keybindings
myKeys' = 
        -- Application starter (rofi)
	[ ((myModMask, xK_d), spawn "rofi -show drun -modi drun#run -show-icons -theme Arc-Dark-Custom")
	]

-- PrettyPrinter format specification for sending info to the status bar (xmobar)
-- `proc` argument is needed to specify where to data is being sent to
myPP proc = xmobarPP 
	{ ppOutput = hPutStrLn proc
	, ppSep = "    " 

	, ppCurrent = xmobarColor myBackgroundColour myTextColour . pad
	, ppVisible = xmobarColor myTextColour myLightBackgroundColour . pad
	, ppHidden = pad 

	, ppLayout = wrap "Layout: " "" . xmobarColor myAlternateTextColour ""
	, ppTitle = wrap "Window:  " "" . xmobarColor myAlternateTextColour "" . shorten 100
	}

-- Workspaces
myWorkspaces = [ "Main"
               , "Browser"
               , "Terminal"
               , "Editor"
               , "5"
               , "Video"
               , "7"
               , "Email"
               , "Music"
               ]               

-- Assign Applications to workspaces when started
myManageHook = composeAll [ className =? "Firefox"     --> doF (W.shift "Browser")
                          , className =? "Emacs"       --> doF (W.shift "Editor")
                          , className =? "Thunderbird" --> doF (W.shift "Email")
                          , className =? "Spotify"     --> doF (W.shift "Music")
			  ]

-- Main xmobar run sequence
main = do
	-- Start the wallpaper manager using the previous config
	nitrogen <- spawn "nitrogen --restore &"
	-- Start a system tray for some applications (e.g. NetworkManager)
--	tray <- spawn "stalonetray &"
	-- Start the status bar using the specified config.
	-- The result of the spawned process is given to the log pretty printer (PP)
        xmproc <- spawnPipe "xmobar $XDG_CONFIG_HOME/xmobar/xmobarrc"
        xmonad $ desktopConfig
        -- Dictionary with custom values and hooks
	        -- manageDocks     will shift the screen so the statusbar is visible
		-- insertPosition  determines where a new window is spawned on the page.
                { manageHook = manageDocks <+> insertPosition End Newer <+> myManageHook <+> manageHook def
                , layoutHook = avoidStruts  $ layoutHook def
                , logHook    = dynamicLogWithPP $ myPP xmproc
		, workspaces = myWorkspaces
                , terminal           = myTerminal
                , modMask            = myModMask
                , borderWidth        = myBorderWidth
                , normalBorderColor  = myNormalBorderColor
                , focusedBorderColor = myFocusedBorderColor
                }
		-- Apply additional custom keys
		`additionalKeys` myKeys'


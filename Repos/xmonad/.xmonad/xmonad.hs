import Data.Default
import Data.Maybe
import System.Exit
import XMonad 
import XMonad.Config.Xfce
import XMonad.Layout.Column
import XMonad.Layout.MosaicAlt
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns
import qualified Data.Map as M
import qualified XMonad.StackSet as W

main = xmonad myConfig

myDefaultConfig = xfceConfig

myConfig =
  myDefaultConfig
  { modMask = mod4Mask
  , terminal = "st"
  , keys = myKeys
  , layoutHook = myLayoutHook
  , qubesColors = myQubesColors
  , borderWidth = 0
  }

myLayoutHook = (myDeco . myGaps $ (simplestFloat ||| MosaicAlt M.empty ||| ThreeColMid 1 (3/100) (1/2))) ||| Full
  where
    myDeco = noFrillsDeco shrinkText def{ fontName="xft:Source Sans Pro-13" }
    myGaps = spacing 5
  

-- Material Colors:             active     inactive
myQubesColors qd = fromMaybe   ("#ffffff","#e0e0e0") . lookup (qubesLabel qd) $ colors
    where colors = zip [1..] [ ("#c2185b","#e91e63") -- red
                             , ("#e64a19","#ff5722") -- orange
                             , ("#ffa000","#ffc107") -- yellow
                             , ("#aed581","#8bc34a") -- green
                             , ("#455a64","#607d8b") -- grey
                             , ("#1976d2","#2196f3") -- blue
                             , ("#7b1fa2","#9c27b0") -- purple
                             , ("#000000","#424242") -- black
                             ]

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    -- launch dmenu
    [ ((modm,               xK_space ), spawn "/home/bogwonch/.local/bin/qvm-launch-dmenu")
    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)
     -- Rotate through the available layout algorithms
    , ((modm,               xK_n     ), sendMessage NextLayout)
    -- Resize viewed windows to the correct size
    , ((modm,               xK_r     ), refresh)
    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)
    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )
    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )
    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)
    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)
    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
 
    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

---
layout: page
title: Keyboard Shortcuts
---
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />

In addition to the standard kodi keyboard, remote and other commands, there are a few
Keyboard Shortcuts specific to Kodi TTS. These shortcuts are defined using keymappings
so that the user can change them at will. Below the default keyboard shortcuts
are used. To modify refer to: [KeyMap](http://smeagol/repo/KEYMAP_TOOL.html).

### Keyboard mappings
Kodi provides a means to define and modify numerous shortcuts for keyboards,
ir-remotes and other devices. Kodi TTS comes with a small set of shortcuts to
help you get started.

(I made the mistake of ignoring the previous keymap assignments. This will be corrected
before Beta is released. Suggestions for improving these assignments are welcome.)

Keyboard (and other input device) mappings are configured in .xml files in Kodi’s
user_data/keymaps directory. The pre-configured one installed with Kodi is named
“kodi.tts.keyboard.xml” It can be directly edited to change the key assignments.
Currently, a keymap editor for this file is not available. (but will be before beta).

What follows are the **current** default keyboard mapping definitions for all platforms:

Function: Advance to next logging mode

        keyboard shortcut F11
        Cycles through severe, error, warning, debug and info

Function: dumps every python thread to the log

        keyboard shortcut ctrl F11
        Useful for debugging

Function: Open Settings

        keyboard shortcut: Ctrl, F12
        Launches the Kodi TTS configuration settings dialog

Function: STOP

        keyboard shortcut: STOP
        Causes currently voiced text to be skipped

Function: VOICE_HINT

        keyboard shortcut: Alt-h
        Voice hint toggles voicing hint text which is currently only embedded in
        the kodi.tts configuration and help dialogs.

Function: REPEAT

        keyboard shortcut: shift, F12

        Repeat voicing the previous item, including complete context (Window name,
        heading, etc. on down to the item itself).

Function EXTRA

        Increase verbosity (more context)

        Shortcut not defined

Function ITEM_EXTRA

        Shortcut not defined

Function TOGGLE_ON_OFF

        keyboard shortcut: F12
        Starts/stops Kodi TTS

Function VOL_UP

        keyboard shortcut: ctrl, shift + (control, shift, plus)
        Changes the volume of the voiced text (not general volume)

Function VOL_DOWN

        keyboard shortcut: ctrl - (control minus)
        Changes the speed of Voiced Text

Function: SPEED_UP

        keyboard shortcut: alt, shift +
        Increases how fast the text is spoken
        Note: At least on the Linux distribution and keyboard that I am
        using, pressing (in order) "alt, shift, +" gets interpreted as
        "meta +", however, pressing "shift, alt, +" is interpreted as
        "shift, meta, 160". More study is required to find better shortcut.

Function: SLOW_DOWN

        keyboard shortcut: alt -
        Reduces how fast text is read

Function: Display Help Dialog

        keyboard shortcut: ctrl F1
        This will launch Kodi’s document reader where you can get more information
        about how to use Kodi TTS.

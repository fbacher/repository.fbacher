---
layout: page
title: Configuration Dialog
---
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />

The Configuration Dialog is a custom Dialog where you can change TTS settings and hear the
changes as they are made. You don't have to change anything. You can press Escape and it
will exit. However, there is one setting in particular that you probably want to change is
the speed of the voice.

You will probably notice that the configuration Dialog is very chatty and helpful. This is
because the first time you run it extra verbosity is enabled. Normally this is enabled/disabled
by pressing a particular key on the keyboard, as determined by the keymap.

## Brief Introduction to Configuration Dialog

For more detailed information see further down this page to [More Configuration Dialog](#more-configuration-dialog).

### To Change Speed

Move the down cursor until you are on the 5th Line. The label will be "Speed 1.2" (or similar).
Use the right cursor (arrow) to increase the speed, or left to reduce the speed.

### Save Settings

In order to save the settings you have chosen, move the cursor down until it reaches the
OK button. Selecting OK will save the settings and dismiss the dialog, returning you to
where you were in Kodi.

### To Make Other Changes

Move the cursor to the line of your choice, such as **Engine** If you click on or press Enter
a Selection Dialog will appear and you will be able to navigate up and down to learn and
hear about the various options. If you press Escape, then no changes will be made to your
Settings. If you select (click on or press Enter) something, then that choice will be
remembered in the Settings Dialog. You can undo your action by going back to the Selection
Dialog and making another choice. Or you can discard all of your changes by pressing Escape
or the Cancel button to the right of the OK button.

# More Configuration Dialog

Kodi TTS does NOT USE Kodi’s addon configuration menus. Instead, it uses custom configuration dialog and code. The reasons for this include:

* Instant audio feedback for changes as they are made
* Ability to revert changes
* Dynamic UI that presents valid choices for the current configuration
* Able to voice items that Kodi’s built-in configuration menus can not
* Ability to voice hints, additional detail as well as help (not fully implemented)

### Shortcut for Configuration Dialog

The Configuration Dialog is accessed by pressing **Ctrl F12**. The Dialog is roughly
organized in the logical order that changes are made. By pressing **Alt-h**
Kodi TTS will voice some terse hint information as you navigate through your choices.
To disable the hints, press **Alt-h** again.

#### Choose Engine

The first thing to choose is the TTS Engine, which is the first dialog item. By pressing
'enter' (or equivalent) a Selection Dialog is displayed that lists all of the available
engines. By changing the focus you will hear each engine speak. Simply select the
engine you want by pressing 'enter' (or equivalent). Note that the change won't be made
permanent until you save it when leaving the Configuration Dialog.

#### Voice speed

By now you may have noticed that the voicing speed has slowed down after you changed
the engine. This is done to make sure the new engine is understandable. To fix the speed,
navigate to the **speed** item. Here you use the left or right cursor to change the
speed. It is recomended that the speed is changed after choosing the engine and
language variant.

#### Language Variant (voice)

After engine selection, the next thing to choose is the 'Language Variant' or voice.
Again, press enter to bring up the Selection Dialog where you can hear each choice.

#### Player

The default player depends on the engine. Generally mpv is preferred since it supports
mp3 (smaller than wave) and 'slave mode' which improves performance, especially when
used with a cache.

Another choice, for engines that support it, is built-in player. A
built-in player is part of the engine, so a separate player does not need to be
installed. The biggest downside is that it is much slower than using a cache.

Similar to using a built-in player is the SFX player. SFX uses Kodi to play the audio.
The advantage being that SFX is always there. However, there are limitations:
  * You can not change speed or volume (without changing Kodi volume)
  * It only works with wave files, requiring a transcoder (slowing things down)
  * Wave files are larger than mpg

#### Caching

Note that you can't configure to use a cache if the current engine or player does
not support it.

Since the process of voice generation is expensive, Caching can greatly speed up
voicing. Currently, there are no limits on cache size, nor is there garbage collection.
For an engine that produces mp3 a cache for a typical library can grow to 1G or more.
Wave files are larger. If you have the space, then a cache is recommended.

A different cache is used for each engine and voice (language variant). Therefore if
you have been using a cache for a few weeks and switched to a new voice, it may be
worth deleting the old cache.

Caches are located within the addon_data directory, by default is:

    * Windows: c:\Users\<user-id>\AppData\Roaming\Kodi\userdata\addon_data
    * Linux: /user/home/<user_id>/.kodi/userdata/addon_data

From there, the cache is located in:

    * Windows: service.kodi.tts\cache\<engine_id>\<language_id>\<country_id>\<voice_id>\
    * Linux: service.kodi.tts/cache/<engine_id>/<language_id>/<country_id>/<voice_id>

For example a cache for google, in english, united states, voice: en-us the cache is
in: /user/home/<user_id>/.kodi/userdata/addon_data/service.kodi.tts/cache/goo/en/us/en-us

For other engines the id's can be completely different.

#### Player Mode

The choice of player modes depends upon the engine and player.

    * SLAVE mode allows a player to run in slave-mode, which is best for caching,
      but should also improve performance in non-cache environments

    * FILE mode tells the player to get the audio from a file

    * PIPE mode is meant to improve performance by transmitting the audio via
      in-memory 'pipes' instead of through a file. However, it is currently
      implemented by going through a file anyway. The option remains because it
      may be useful in the future.

    * ENGINE_SPEAK mode uses the engine's built-in player (if supported).

#### Volume

Volume is always measured in decibels, with 0.0dB being 'normal' volume. An attempt
is made to have a volume of 0.0dB about the same across the different engines and players,
however, not a great deal of effort has been put into this, so far.

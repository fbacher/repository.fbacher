---
layout: page
title: Install Optional Programs
---
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />

# Install on Windows

The Google TTS engine requires mpv in order to play the voices. mpv can also play the
voicings produced by Windows TTS (Navigator). Mpv has several desirable features:

  * Able to adjust the speed (tempo) without altering the pitch. By altering the speed
    in the player, a cached recording can be played at different speeds without regenerating
    the recording.

  * Able to run in 'slave-mode' which allows Kodi TTS addon to control mpv better, making it
    more responsive and reliable.

  * Slave mode also lets a single mpv instance play many recordings. Without it,
    mpv would have to be launched for each recording, and there are many.

## Install mpv on Windows

The official [mpv development site](https://mpv.io/installation/) does not produce builds,
however, you can get a recent build from one of [the recommended sites](https://nightly.link/mpv-player/mpv/workflows/build/master).
Despite being a daily build, the builds are generally appropriate for general use. Look
for a build which is appropriate for your platform, one with "mpv-x86_64" in it, such as:
[this link](https://nightly.link/mpv-player/mpv/workflows/build/master/mpv-x86_64-pc-windows-msvc).

**The following steps will require Admin privilege.**

  * Create the folder **C:\Program Files\mpv**
  * Unzip the downloaded files into the directory just created
  * As admin, run the script **C:\Program Files\mpv\installer\mpv-install.bat**

## Install eSpeak-NG on Windows

Install eSpeak-NG through the Windows App installer.

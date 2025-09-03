---
layout: page
title: Install Kodi TTS on Linux
---
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />

## Prerequites:

  * Recent Linux
  * Kodi 20 (Nexus) or Kodi 21 (Omega)-preferred

### Install Private Kodi Repository

In order to simplify the installation of the latest Kodi TTS builds, a private Addon
Repository was created. You only need to install the Repository Addon once. It will
inform you of any updates.

  * To install the repository, first [Download the repository addon .zip file](http://smeagol/repo/repo/zips/repo.fbacher/repo.fbacher-1.0.0.zip).
  * Next, from Kodi, in Kodi, go to **Settings -> Add-ons -> Add-on browser -> Install from zip file**.
  * You may get a warning about installing software from strangers. Follow the instructions to
    enable installing addons from a .zip file.

## Installing Kodi TTS

After the repository has installed, install Kodi TTS from that repository by navigating 
to **Settings -> Add-ons -> Add-on browser -> Install from repository** 
  * Choose **Kodi TTS repository**
  * Choose **Services**
  * Choose **Kodi Screen Reader**
  * Kodi will inform you that several other addons will be installed, including an addon
    **pydevd** that is not available. Press Enter to start the installation.
  * The installation will take up to a minute as it downloads addons and installs them

### Kodi TTS First Run

When Kodi TTS runs for the first time it performs several setup tasks:

  * Several windows will quickly flash by an dissapear
  * Kodi should begin voicing its progress. A notification will be read before each step, each
    taking about five seconds to read. The installation/modification of a basic keymap named
    service.kodi.tts.keyboard.xml will be announced.
  * Next, it will announce that Hint Text is enabled.
  * Finally, TTS announces that the Configuration Dialog will be displayed.

### Configuration Dialog

[Link to Configuration Dialog](http://smeagol/repo/CONFIG_DIALOG.html)

### Keyboard Shortcuts

[Link to Keyboard Shortcuts](http://smeagol/repo/KEYBOARD_SHORTCUTS.html)

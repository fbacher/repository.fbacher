BEGIN {
  # REPO_TTS = URL_REPO "/service.kodi.tts"
  LANGCODES_ZIP = "script.module.langcodes/script.module.langcodes"
  LANGCODES_ZIP_VERSION = "-3.4.0~alpha.zip"
  REPO_ZIP = "repo.fbacher/repo.fbacher"
  REPO_ZIP_VERSION = "-1.0.0.zip"
  TTS_ZIP = "service.kodi.tts/service.kodi.tts"
  TTS_ZIP_VERSION = "-2.0.7~alpha.zip"

  if (SITE == "github")
   {
      URL_PREFIX = "https://fbacher.github.io/repository.fbacher"
      URL_ZIPS = URL_PREFIX "/blob/master/repo/zips"
   }
  else if (SITE == "smeagol")
     {
      URL_PREFIX = "http://smeagol"
      URL_ZIPS = "http://smeagol/repo/zips"
      }
  else if (SITE == "feuerbacher")
     {
      URL_PREFIX = "https://feuerbacher.us/repo"
      URL_ZIPS = URL_PREFIX "/repo/zips"
      }
  {
  INSTALL_WINDOWS = URL_PREFIX "/INSTALL_WINDOWS"
  INSTALL_LINUX = URL_PREFIX "/INSTALL_LINUX"
  KEYBOARD_SHORTCUTS = URL_PREFIX "/KEYBOARD_SHORTCUTS.html"
  KEYMAP_TOOL = URL_PREFIX "/KEYMAP_TOOL.html"
  CONFIG_DIALOG = URL_PREFIX "/CONFIG_DIALOG.html"
  INSTALL_WINDOWS = URL_PREFIX "/INSTALL_WINDOWS.html"
  INSTALL_LINUX = URL_PREFIX "/INSTALL_LINUX.html"
  INSTALL_WIN_PROGS = URL_PREFIX "/INSTALL_WINDOWS_PROG.html"
  INSTALL_LINX_PROGS = URL_PREFIX "/INSTALL_LINUX_PROG.html"

  URL_LANGCODES_ZIP = URL_ZIPS "/" LANGCODES_ZIP LANGCODES_ZIP_VERSION
  URL_TTS_ZIP = URL_ZIPS "/" TTS_ZIP TTS_ZIP_VERSION
  URL_REPO_ZIP = URL_ZIPS "/" REPO_ZIP REPO_ZIP_VERSION
  }
}

END {}
/URL_PREFIX/ {sub("URL_PREFIX", URL_PREFIX); print($0); next}
/URL_LANGCODES_ZIP/ {sub("URL_LANGCODES_ZIP", URL_LANGCODES_ZIP); print($0); next}
/URL_REPO_ZIP/ {sub("URL_REPO_ZIP", URL_REPO_ZIP); print($0); next}
/URL_TTS_ZIP/ {sub("URL_TTS_ZIP", URL_TTS_ZIP); print($0); next}

/INSTALL_WINDOWS/ {sub("INSTALL_WINDOWS", INSTALL_WINDOWS); print($0); next}
/INSTALL_LINUX/ {sub("INSTALL_LINUX", INSTALL_LINUX); print($0); next}
/INSTALL_WIN_PROGS/ {sub("INSTALL_WIN_PROGS", INSTALL_WIN_PROGS); print($0); next}
/INSTALL_LINX_PROGS/ {sub("INSTALL_LINX_PROGS", INSTALL_LINX_PROGS); print($0); next}
/CONFIG_DIALOG/ {sub("CONFIG_DIALOG", CONFIG_DIALOG); print($0); next;}
/KEYBOARD_SHORTCUTS/ {sub("KEYBOARD_SHORTCUTS", KEYBOARD_SHORTCUTS); print($0); next;}
/KEYMAP_TOOL/ {sub("KEYMAP_TOOL", KEYMAP_TOOL); print($0); next;}


{print($0); next;}

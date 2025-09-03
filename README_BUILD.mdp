---
layout: page
title: About building the Kodi TTS Repository
---
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />

The Kodi TTS Repository serves multiple purposes:

    * Primarily it is to create a private Kodi Repository to simplify installation
      of Kodi TTS
    * Constructs a web-site to host the repository and to provide information to the user
    * Provides documentation on how to install, configure, etc.
    * Provides documentation for how to build and maintain the site

## How to build the repository

This project includes service.kodi.tts and script.module.langcodes as subprojects. 
Before you build the repository, you need to update those subprojects to be in sync 
with the release you wish to publish. Follow instructions for github on how to do this.
The subprojects are in the 'repo' directory.

This project can produce repositories for 'smeagol' (my home computer), 'feuerbacher.us'
(a dreamhost site that I own) and github. To choose which site to build you edit
build_html.sh. Uncomment out the line with the SITE host that you desire, leaving the
others commented out. (ex. SITE = "feuerbacher.us").

Next run build_html.sh, which will:

  * Run **addon.awk** to substitute paths/urls appropriate for the site in all of the 
    files that make up the site.
  * Run **jekyll build** using the minima 3+ theme to build to construct the site
  * The completed site is in _site

You should be able to copy the contents of _site over to your web server.

## About Jekyll and minima

Jekyll and minima are used to construct the website. They were chosen primarily
because Jekyll and a precursor to minima are used by github to provide their site.
Since I did not want to require uses to have github accounts, I made sure that I could
use other hosts. I also wanted to add documentation and perhaps a blog, which Jekyll 
supports.

I use the latest version of Jekyll (based on Ruby). Minima has not had a release since
2.4, which is four or more years old. It lacks some features I need, so I am using
(like many others) a development build for minima 3.0+. **Gemfile** contains the 
exact git commit that I use: **gem "minima", github: "jekyll/minima", ref: "1e8a445"
**. I did make tweaks to the default settings through alterations to **Gemfile** and
**_config.yml** as well as overriding the layout by adding files in **_includes** and
**_layouts**. 

## About .mdp files

awk substitues values in **.mdp** to produce **.md** files which jekyll will use to
produce .html files. In general .md files are not checked in. It is important to have 
the heading to each .mdp (and .md) file:

    ---
    layout: page
    title: About building the Kodi TTS Repository
    ---
    <meta http-equiv='Content-Type' content='text/html; charset=utf-8' />

  * The layout is almost always page
  * The title appears as an 'h1' header
  * The meta makes sure the source is interpreted as utf-8. Without this, apostrophes
    showed up as something resembling the Euro symbol.

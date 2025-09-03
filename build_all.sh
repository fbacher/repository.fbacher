#!/usr/bin/sh
#set -x
./build_html.sh

bundle exec jekyll build

echo "Run the following command, as appropriate"
echo rm -rf '/var/www/html/repo/*'

echo cp -rp '_site/*' /var/www/html/repo
echo sudo systemctl restart apache2

#!/usr/bin/env bash


export FF_VERSION=45.9.0esr


echo "-------------------------- Start -----------------------"
echo "Change FF version to ${FF_VERSION}"
cd /tmp
sudo mkdir -p /usr/local/firefox/${FF_VERSION}
wget  -O firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-${FF_VERSION}&os=linux64&lang=en-US"
sudo tar xjf firefox.tar.bz2 -C /usr/local/firefox/${FF_VERSION} --strip-components 1
rm -f firefox.tar.bz2


FIREFOX_CURRENT=$(which firefox)
echo "FIREFOX_CURRENT: ${FIREFOX_CURRENT}"
sudo unlink ${FIREFOX_CURRENT}
ll /usr/local/firefox/${FF_VERSION}/
sudo ln -s /usr/local/firefox/${FF_VERSION}/firefox /usr/bin/firefox

echo "FIREFOX_CURRENT: ${FIREFOX_CURRENT} "
echo "FIREFOX_VERSION: $(firefox -v)"

cd -
echo "-------------------------- end -----------------------"


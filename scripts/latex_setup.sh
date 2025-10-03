#!/bin/bash

apt-get update
apt remove 'texlive*'
apt-get install -y texlive-latex-base #texlive-extra-utils
apt-get install xzdec
# tlmgr init-usertree
# tlmgr repository add ftp://tug.org/historic/systems/texlive/2023/tlnet-final
# # tlmgr repository remove http://mirror.ctan.org/systems/texlive/tlnet
# tlmgr option repository ftp://tug.org/historic/systems/texlive/2023/tlnet-final
# tlmgr update --all
# tlmgr --verify-repo=none install fira
# pdflatex --version
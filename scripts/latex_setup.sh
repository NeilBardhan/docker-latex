#!/bin/bash

apt-get update
apt install -y wget
# apt-get install -y perl-CPAN
apt-get install -y perl-doc
cpan -y Pod::Usage
# apt remove 'texlive*'
# apt-get install -y texlive-latex-base #texlive-extra-utils

wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz 
zcat < install-tl-unx.tar.gz | tar xf -
cd install-tl-2*
perl ./install-tl --no-interaction --scheme=small --no-doc-install --no-src-install 
export PATH="/usr/local/texlive/2025/bin/x86_64-linux:$PATH"

# apt-get install -y xzdec
tlmgr init-usertree
# tlmgr repository list
# tlmgr repository add ftp://tug.org/historic/systems/texlive/2023/tlnet-final
# # tlmgr repository remove http://mirror.ctan.org/systems/texlive/tlnet
# tlmgr option repository ftp://tug.org/historic/systems/texlive/2023/tlnet-final
tlmgr update --all
tlmgr install fira fontawesome5 fontaxes mwe tikz scalerel stackengine newtxsf
# pdflatex --version
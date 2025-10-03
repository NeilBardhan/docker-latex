#!/bin/bash

pwd && ls -lah /app/
apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
&& apt install -y wget \
&& apt-get install -y perl-doc \
&& cpan --yes Pod::Usage

# apt remove 'texlive*'
# apt-get install -y texlive-latex-base #texlive-extra-utils

wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz  \
&& zcat < install-tl-unx.tar.gz | tar xf - \
&& cd install-tl-2* \
&& perl ./install-tl --no-interaction --scheme=small --no-doc-install --no-src-install \
&& export PATH="/usr/local/texlive/2025/bin/x86_64-linux:$PATH" \
&& cd ..

# apt-get install -y xzdec
# tlmgr repository list
# tlmgr repository add ftp://tug.org/historic/systems/texlive/2023/tlnet-final
# # tlmgr repository remove http://mirror.ctan.org/systems/texlive/tlnet
# tlmgr option repository ftp://tug.org/historic/systems/texlive/2023/tlnet-final

tlmgr init-usertree \
&& tlmgr update --all \
&& tlmgr install fira \
&& tlmgr install fontawesome5 \
&& tlmgr install fontaxes \
&& tlmgr install mwe \
&& tlmgr install scalerel \
&& tlmgr install stackengine \
&& tlmgr install newtxsf

cd /app/ \
&& pdflatex sample.tex \
&& ls -lah
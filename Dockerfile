FROM ubuntu:latest

# Install base packages
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
       wget ca-certificates perl-doc cpanminus make perl \
    && cpanm --notest Pod::Usage \
    && rm -rf /var/lib/apt/lists/*

# Install TeX Live
RUN wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
    && tar -xzf install-tl-unx.tar.gz \
    && cd install-tl-* \
    && perl ./install-tl --no-interaction --scheme=small --no-doc-install --no-src-install \
    && cd .. \
    && rm -rf install-tl-* install-tl-unx.tar.gz \
    && /usr/local/texlive/2025/bin/x86_64-linux/tlmgr init-usertree \
    && /usr/local/texlive/2025/bin/x86_64-linux/tlmgr update --all \
    && /usr/local/texlive/2025/bin/x86_64-linux/tlmgr install \
       fira fontawesome5 fontaxes mwe scalerel stackengine newtxsf

# Add TeX Live to PATH
ENV PATH="/usr/local/texlive/2025/bin/x86_64-linux:${PATH}"

# Add compile script
COPY scripts/latex_compile.sh /usr/local/bin/latex_compile.sh
RUN chmod +x /usr/local/bin/latex_compile.sh

WORKDIR /data
ENTRYPOINT ["latex_compile.sh"]

FROM ubuntu:latest

COPY scripts/latex_setup.sh /app/latex_setup.sh
COPY latex-code/sample.tex /app/sample.tex

RUN chmod +x /app/latex_setup.sh

ENTRYPOINT ["/app/latex_setup.sh"]
# docker-latex
Docker build environment for building latex docs

## How To

  1. Build the docker image

```bash
docker build -t dockerlatex . 
```

  2. Copy `.tex` files to `latex-code`
  3. Run the docker container with : 

```bash
docker run --rm -v $(pwd)/latex-code:/data dockerlatex {TEX_FILE_NAME}.tex
```

The compiled pdf files will be saved in `latex-code/compile-output`.
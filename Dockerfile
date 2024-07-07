FROM texlive/texlive:latest

# Build commands, cause I always forget :)

# docker build -t latex2md .
# docker run -it -v $PWD:/code latex2md

LABEL maintainer "@miladrabi"
ENV DEBIAN_FRONTEND noninteractive

ADD . /code
RUN chmod u+x /code/entrypoint.sh
WORKDIR /code

ENTRYPOINT ["/bin/sh", "/code/entrypoint.sh"]
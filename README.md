# docker-ubuntu-dev

docker image of ubuntu with common dev tools.

## Usage

```sh
docker run -it --rm -v "$PWD":/proj -w /proj ubuntu-dev
```
It will load current folder as `/proj` folder in docker container and open a terminal for interaction.

## Environment

- Ubuntu 18.04

This image based on Ubuntu 18.04 with IPv6 disabled when doing the apt operation. The apt cache is not deleted on purpose just in case if extra tools need to be installed based on this image.


## Installed common tools

- sudo
- software-properties-common (for apt-add-repository)
- git
- zip, unzip
- curl, wget
- vim (just in case)


### Python

Install python3, pip3, and packages:

- requests
- beautifulsoup4


## Ref

.PHONY: all build run
PROJECT_ROOT = $(shell pwd)

all: build
	docker run -it -v ${PROJECT_ROOT}:/code latex2pdf

build:
	docker build -t latex2pdf .

# For Testing purposes
run:
	bundle exec jekyll serve
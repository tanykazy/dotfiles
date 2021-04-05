#!/usr/bin/make -f

SHELL = /bin/sh

.SUFFIXES:

HOMEPATH := $(HOME)
DOTPATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILESDIR := .files
DOTFILES := $(wildcard $(DOTPATH)/$(DOTFILESDIR)/.??*)

#PACKAGES := screen vim


.PHONY: all list install clean test

all:


#configure:
#	@apt install $(PACKAGES)


install:
	@$(foreach val, $(DOTFILES), \
		ln -snv $(abspath $(val)) $(HOMEPATH)/$(notdir $(val));)


clean:
	@-$(foreach val, $(DOTFILES), \
		rm -vf $(HOMEPATH)/$(notdir $(val));)


test:
	@./bin/install $(DOTPATH)/$(DOTFILESDIR) $(HOMEPATH)




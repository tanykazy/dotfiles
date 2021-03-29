#!/usr/bin/make -f

SHELL = /bin/sh

.SUFFIXES:

HOMEPATH := $(HOME)
DOTPATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILESDIR := .files
DOTFILES := $(wildcard $(DOTPATH)/$(DOTFILESDIR)/.??*)



.PHONY: all list install clean

all:


list:
	@$(foreach val, $(DOTFILES), \
		ls -dF $(val);)


install:
	@$(foreach val, $(DOTFILES), \
		ln -sfnv $(abspath $(val)) $(HOMEPATH)/$(notdir $(val));)


clean:
	@-$(foreach val, $(DOTFILES), \
		rm -vf $(HOMEPATH)/$(notdir $(val));)


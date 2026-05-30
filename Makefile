#!/usr/bin/make -f

SHELL = /bin/sh

.SUFFIXES:

HOMEPATH := $(HOME)
DOTPATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILESDIR := .files
DOTFILES := $(wildcard $(DOTPATH)/$(DOTFILESDIR)/.??*)


.PHONY: all clean install test


all:


clean:
	@-$(foreach val, $(DOTFILES), \
		rm -vf $(HOMEPATH)/$(notdir $(val));)


install:

ifdef FILE
	@ln -snv $(abspath $(FILE)) $(HOMEPATH)/$(notdir $(FILE))

else
	@$(foreach val, $(DOTFILES), \
		ln -snv $(abspath $(val)) $(HOMEPATH)/$(notdir $(val));)

endif


test:
	@./bin/install $(DOTPATH)/$(DOTFILESDIR) $(HOMEPATH)



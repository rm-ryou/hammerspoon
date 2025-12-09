#! /usr/bin/env -S just --justfile

SRC_DIR := justfile_directory()
DIST_DIR := env("HOME") + "/.hammerspoon"

default:
  @just --list

install:
  @ln -sfn {{SRC_DIR}} {{DIST_DIR}}
  @echo "Hammerspoon setup is completed!"

help:
  @echo "Available recipes:"
  @echo ""
  @echo "  just install     # Setup Hammerspoon config"

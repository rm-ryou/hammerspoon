#! /usr/bin/env -S just --justfile

SRC_DIR := justfile_directory()
DIST_DIR := env("HOME") + "/.hammerspoon"

default:
    @just --list

install:
    @ln -sfn {{ SRC_DIR }} {{ DIST_DIR }}
    @echo "Linked Hammerspoon config to {{ DIST_DIR }}"

uninstall:
    @rm {{ DIST_DIR }}
    @echo "Removed Hammerspoon config symlink ({{ DIST_DIR }})"

help:
    @echo "Available recipes:"
    @echo ""
    @echo "  just install     # Setup Hammerspoon config"
    @echo "  just uninstall   # Clean up Hammerspoon config"

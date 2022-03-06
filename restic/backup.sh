#!/bin/bash
source config
restic backup $HOME/volumes --exclude-file=excludes.txt
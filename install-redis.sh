#!/bin/bash
nusr=$USER

if  [ ${nusr} = "root" ]; then
    printf "do NOT run as sudo\n\n"
    exit 1
fi
#!/bin/bash
setsid ./streamgrab.sh $1 >/dev/null 2>$HOME/livestreams/bin/error.log < /dev/null &

#!/bin/bash
pids=$(pidof youtube-dl)
if [[ $pids ]]
then
	echo Killing youtube-dl $pids
	kill -9 $pids
fi

pids=$(pidof ffmpeg)
if [[ $pids ]]
then
	echo Killing ffmpeg $pids
	kill -INT $(pidof ffmpeg)
fi

pids=$(ps -fade | grep streamgrab.sh | grep -v grep | awk '{print $2}')
if [[ $pids ]]
then
	echo Killing streamgrab $pids
	kill -9 $pids
fi

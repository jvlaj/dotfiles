#!/bin/bash

i3status | while :
do
        read line
        artist=$(cmus-remote -Q | grep ' artist ' | cut -d ' ' -f3-)
        song=$(cmus-remote -Q | grep title | cut -d ' ' -f3-)
        position=$(cmus-remote -Q | grep position | cut -d ' ' -f2-)
        duration=$(cmus-remote -Q | grep duration | cut -d ' ' -f2-)
        time="$(expr $position / 60) - $(expr $duration / 60)"
        echo "$artist - $song : $time                                                       $line" || exit 1
done


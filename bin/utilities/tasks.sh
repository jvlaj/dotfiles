#!/bin/bash
xdotool search --onlyvisible --classname Tasks windowunmap || urxvtc -name Tasks -geometry 55x15+50+50 -hold -e sh -c "todo.sh;bash --rcfile .bashrctasks"

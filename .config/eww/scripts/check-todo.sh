#!/bin/bash

todo="$(todo.sh list | head -n -2 | sed -e '/[0-9]\+[[:blank:]]x/d' -e 's/\x1B\[[0-9;]*[JKmsu]//g;/. x 2/d')"
aprinum=$(echo "$todo" | grep "^[[:digit:]]*[[:blank:]](A).*$" | wc -l)
otherprinum=$(echo "$todo" | grep -v "^[[:digit:]]*[[:blank:]](A).*$" | wc -l)

case $1 in
	# (A) priority todo (highest)
	apri)
		echo "$todo" | grep "^[[:digit:]]*[[:blank:]](A).*$" | sed 's/. (.) //g';;
	aprinum)
		echo $aprinum ;;
	# Other pri
	otherpri)
		echo "$todo" | grep -v "^[[:digit:]]*[[:blank:]](A).*$" | sed 's/. (.) //g' ;;
	otherprinum)
		echo $otherprinum ;;
	# Adaptive
	adaptive)
		if [ "$aprinum" -gt 0 ]; then
			echo "$todo" | grep "^[[:digit:]]*[[:blank:]](A).*$" | sed 's/. (.) //g'
		elif [ "$otherprinum" -gt 0 ]; then
			echo "$todo" | grep -v "^[[:digit:]]*[[:blank:]](A).*$" | sed 's/. (.) //g'
		else
			echo ""
		fi
		;;
	adaptivenum)
		if [ "$aprinum" -gt 0 ]; then
			echo $aprinum
		elif [ "$otherprinum" -gt 0 ]; then
			echo $otherprinum
		else
			echo "0"
		fi
		;;
	totnum)
		echo "$todo" | wc -l ;;
	appoint) # checks next appointment
		base="$(calcurse -n | tail -n +2)"
		base="${base#"${base%%[![:space:]]*}"}"
		echo "${base##*] }"
		;;
	appoint-time)
		base="$(calcurse -n | tail -n +2)"
		time_left="${base#*[}"
		echo "${time_left%]*}" | sed -E 's/([[:digit:]]+):0?([[:digit:]]+)/\1h \2min/'
		;;
esac


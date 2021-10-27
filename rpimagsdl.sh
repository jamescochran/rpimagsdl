#/!bin/bash
clear
# Script to download like all of the raspberrypi foundation magazines
# It will only overwrite an issue if the date appears newer
# Otherwise it should skip downloaded issues already downloaded

# TODO - This is very inefficient. It will literally hammer each of these sites 301 times.
# 	Regardless if we have the issue. Regardless if we know the issue doesn't exist.
#	e.g. custompc doesn't even start their issues until 201 or something
#	so lazy me am ust iterating 301 times...
# TODO - the helloworld doesn't even work becauase their scheme is the same all the way up until the end "download" is omitted
# TODO - I'm sure this could all be done better but it's the result of googling about wget for 10 minutes.. 
#	and me not wanting to click around on the website a bunch of times
# ENJOY!

for n in magpi hackspace wireframe custompc helloworld
    do
        for i in {0..300}
            do
                echo "Downloading " $n " issue " $i
                wget -rnd -e robots=off -N -A.pdf -P $n --follow-tags=iframe https://$n.raspberrypi.com/issues/$i/pdf/download
            done
    done

#!/bin/bash

if [ ! -d /tmp/stream ]
then
    mkdir /tmp/stream/
fi

if pgrep raspistill > /dev/null
then
    echo "raspistill already running"
else
   raspistill --nopreview -w 2592 -h 1944 -q 5 -o /tmp/stream/pic.jpg -tl 100 -t 9999999 -th 0:0:0 &
    echo "raspistill started"
fi

if pgrep mjpg_streamer > /dev/null
then
    echo "mjpg_streamer already running"
else
   LD_LIBRARY_PATH=/usr/local/lib mjpg_streamer -i "input_file.so -f /tmp/stream -n pic.jpg" -o "output_http.so -w /usr/local/www"&
    echo "mjpg_streamer started"
fi

if pgrep python > /dev/null
then
    echo "cam_blink.py already running"
else
    sudo python cam_blink.py > /dev/null&
    echo "cam_blink.py started"
fi

sudo nohup ./stream_control.sh




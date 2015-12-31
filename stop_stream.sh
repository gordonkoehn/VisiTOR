#!/bin/bash

if pgrep raspistill 
then
    kill $(pgrep raspistill) > /dev/null 2>&1
    echo "raspistill stopped"
else
    echo "raspistill not running"
fi

if pgrep mjpg_streamer
then
    kill $(pgrep mjpg_streamer) > /dev/null 2>&1
    echo "mjpg_streamer stopped"
else
    echo "mjpg_streamer not running"
fi

if pgrep python
then 
    kill $(pgrep python) > /dev/null 2>&1
     echo "cam_blink.py stopped"	
else
    echo "cam_blink.py not running"
fi



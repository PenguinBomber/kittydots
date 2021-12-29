#!/bin/bash

if [ 0 = `cat /sys/class/leds/input4::capslock/brightness` ]
then
    echo ""
else
    echo " Capslock"
fi
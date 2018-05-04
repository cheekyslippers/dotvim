#!/bin/bash
#Allow display over-ride without having to re-source the bashrc file


#Display setting for PuTTY with GoGlobal
if [ $HOST == hhgw20 ]; then
   displaynum=`ps -aef | grep "$USER.*xinit.*gowm" | grep -v grep | sed "s/.*\(:[0-9]*\).*/\1/"`
   export DISPLAY="${HOST}${displaynum}";
fi

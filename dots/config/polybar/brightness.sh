#!/bin/bash

if [[ "" = `command -v blight` ]]
then
    echo ""
else
    echo  `blight -d amdgpu_bl0 get`
fi
#!/bin/bash

EMAIL=karaokemp@gmail.com
PASSWORD=BestCampInMidburn2016!
BASE_FOLDER=new
BASE_FOLDER_PATH=/Root/$BASE_FOLDER
FILE_NAME=$(echo *.mp4)

MONTH=$(date +%m_%Y)
FOLDER=$MONTH
FOLDER_PATH=/Root/$BASE_FOLDER/$FOLDER

echo "uploading to mega"
megamkdir -u $EMAIL -p $PASSWORD $BASE_FOLDER_PATH
megamkdir -u $EMAIL -p $PASSWORD $FOLDER_PATH
megaput -u $EMAIL -p $PASSWORD --path $FOLDER_PATH "$FILE_NAME"
rm "$FILE_NAME"

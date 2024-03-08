#!/bin/bash

        #provide the path of directory where you want to perfom this task
BASE_PATH="path of the directory"

        #provide how many days old files you want to archive
DAYS=10  # taken 10 days by default

        #provide the minimum size of the file you want to archive
SIZE=20M  # taken 20 Mb by default

        #provide the depth : means in how many subdirectories will you want to          perform the task
DEPTH=1  # taken 1 by default

RUN=0

if [[ ! -d $BASE_PATH ]]
then
	echo "Directory does not exists"
	exit 1
fi

if [[ ! -d $BASE_PATH/archive ]]
then
	mkdir $BASE_PATH/archive
fi

for i in `find $BASE_PATH -maxdepth $DEPTH -type f -size +$SIZE`
do
	if [[ $RUN -eq 0 ]]
	then
		gzip $i || exit 1
		mv $i.gz $BASE_PATH/archive || exit 1
	fi
done

for i in `find $BASE_PATH -maxdepth $DEPTH -type f -mtime +$DAYS`
do
        if [[ $RUN -eq 0 ]]
        then
                gzip $i || exit 1
                mv $i.gz $BASE_PATH/archive || exit 1
        fi
done



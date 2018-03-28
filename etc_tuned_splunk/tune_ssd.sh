#!/bin/sh

. /usr/lib/tuned/functions

start() {
    # ensure the disk is set to non rotational
    # other parameters and details:
    # https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Performance_Tuning_Guide/sect-Red_Hat_Enterprise_Linux-Performance_Tuning_Guide-Storage_and_File_Systems-Configuration_tools.html
    echo 0 > /sys/block/sdd/queue/rotational
    echo 0 > /sys/block/sdb/queue/rotational
    return 0
}

stop() {
    return 0
}

process $@

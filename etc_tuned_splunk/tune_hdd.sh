#!/bin/sh

. /usr/lib/tuned/functions

start() {
    # other parameters and details:
    # https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Performance_Tuning_Guide/sect-Red_Hat_Enterprise_Linux-Performance_Tuning_Guide-Storage_and_File_Systems-Configuration_tools.html

    # increase the max I/O queue size on rotating devices (only)
    # (setting this on SSD/FLASH will have no effect at all)
    # details and further links: https://www.monperrus.net/martin/scheduler+queue+size+and+resilience+to+heavy+IO
    for d in $(lsblk -nd -io KNAME --include 8);do 
        for r in $(grep 1 /sys/block/$d/queue/rotational);do 
            echo 1024 > /sys/block/$d/queue/nr_requests
        done
    done
    return 0
}

stop() {
    return 0
}

process $@

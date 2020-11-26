#!/bin/sh
##################################################

# Change this to your cribl installation directory & user
CRIBLH=/opt/cribl
CRIBL_USER=clintsharp

#######################################################################################################################

. /usr/lib/tuned/functions

start() {
    su - $CRIBL_USER
    echo "$(date) - logstream init start: nofiles soft $(ulimit -Sn)" >> $CRIBLH/log/splunk-init-ulimit.log
    echo "$(date) - logstream init start: nofiles hard $(ulimit -Hn)" >> $CRIBLH/log/splunk-init-ulimit.log
    echo "$(date) - logstream init start: no processes $(ulimit -u)" >> $CRIBLH/log/splunk-init-ulimit.log
    echo "$(date) - logstream init start: max file size $(ulimit -f)" >> $CRIBLH/log/splunk-init-ulimit.log
    echo "$(date) - logstream init start: data segment size $(ulimit -d)" >> $CRIBLH/log/splunk-init-ulimit.log
    ulimit -Hn 65536
    ulimit -Sn 32768
    ulimit -u 32000
    ulimit -f unlimited
    ulimit -d unlimited
    echo "$(date) - logstream init end : nofiles soft $(ulimit -Sn)" >> $CRIBLH/log/splunk-init-ulimit.log
    echo "$(date) - logstream init end : nofiles hard $(ulimit -Hn)" >> $CRIBLH/log/splunk-init-ulimit.log
    echo "$(date) - logstream init end : no processes $(ulimit -u)" >> $CRIBLH/log/splunk-init-ulimit.log
    echo "$(date) - logstream init end : max file size $(ulimit -f)" >> $CRIBLH/log/splunk-init-ulimit.log
    echo "$(date) - logstream init end : data segment size $(ulimit -d)" >> $CRIBLH/log/splunk-init-ulimit.log
    return 0
}

stop() {
    return 0
}

process $@

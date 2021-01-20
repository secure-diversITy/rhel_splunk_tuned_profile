#!/bin/sh

. /usr/lib/tuned/functions
SPLUNKH=/opt/splunk

start() {
    su - $SPLUNK_OS_USER
    echo "$(date) - splunk init start: nofiles soft $(ulimit -Sn)" >> $SPLUNKH/var/log/splunk/splunk-init-ulimit.log
    echo "$(date) - splunk init start: nofiles hard $(ulimit -Hn)" >> $SPLUNKH/var/log/splunk/splunk-init-ulimit.log
    echo "$(date) - splunk init start: no processes $(ulimit -u)" >> $SPLUNKH/var/log/splunk/splunk-init-ulimit.log
    echo "$(date) - splunk init start: max file size $(ulimit -f)" >> $SPLUNKH/var/log/splunk/splunk-init-ulimit.log
    echo "$(date) - splunk init start: data segment size $(ulimit -d)" >> $SPLUNKH/var/log/splunk/splunk-init-ulimit.log
    ulimit -Hn 65536
    ulimit -Sn 32768
    ulimit -u 16000
    ulimit -f unlimited
    ulimit -d unlimited
    echo "$(date) - splunk init end : nofiles soft $(ulimit -Sn)" >> $SPLUNKH/var/log/splunk/splunk-init-ulimit.log
    echo "$(date) - splunk init end : nofiles hard $(ulimit -Hn)" >> $SPLUNKH/var/log/splunk/splunk-init-ulimit.log
    echo "$(date) - splunk init end : no processes $(ulimit -u)" >> $SPLUNKH/var/log/splunk/splunk-init-ulimit.log
    echo "$(date) - splunk init end : max file size $(ulimit -f)" >> $SPLUNKH/var/log/splunk/splunk-init-ulimit.log
    echo "$(date) - splunk init end : data segment size $(ulimit -d)" >> $SPLUNKH/var/log/splunk/splunk-init-ulimit.log
    return 0
}

stop() {
    return 0
}

# only process the above when splunk is installed actually
if [ -f $SPLUNKH/etc/splunk-launch.conf ];then
    . $SPLUNKH/etc/splunk-launch.conf
    process $@
fi

#!/bin/sh


/opt/snap/bin/snapd -t ${SNAP_TRUST_LEVEL} -l ${SNAP_LOG_LEVEL} -o '' &
sleep 5
snapctl plugin load $GOPATH/src/github.com/intelsdi-x/snap-plugin-collector-cassandra/build/rootfs/snap-plugin-collector-cassandra

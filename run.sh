#!/usr/bin/env bash

/usr/sbin/sshd -D &

$HADOOP_PREFIX/sbin/hadoop-daemon.sh start namenode
$HADOOP_PREFIX/sbin/start-dfs.sh
$HADOOP_PREFIX/sbin/start-yarn.sh

cd $HIVE_HOME && bin/schematool -initSchema -dbType derby
$HIVE_HOME/bin/hive --service hiveserver2 --hiveconf hive.root.logger=INFO,console

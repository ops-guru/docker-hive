#!/usr/bin/env bash

/usr/sbin/sshd -D &

echo "starting fs"
$HADOOP_PREFIX/sbin/start-dfs.sh

$HADOOP_PREFIX/sbin/start-yarn.sh

echo "creating folders"
$HADOOP_PREFIX/bin/hdfs dfs -mkdir /user
$HADOOP_PREFIX/bin/hdfs dfs -mkdir /user/root
$HADOOP_PREFIX/bin/hdfs dfs -mkdir /user/hive
$HADOOP_PREFIX/bin/hdfs dfs -mkdir /tmp
$HADOOP_PREFIX/bin/hdfs dfs -mkdir /user/hive/warehouse
$HADOOP_PREFIX/bin/hdfs dfs -chmod 777 /tmp
$HADOOP_PREFIX/bin/hdfs dfs -chmod 777 /user/hive/warehouse
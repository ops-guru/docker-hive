#!/usr/bin/env bash

/usr/sbin/sshd -D &

echo "starting fs"

$HADOOP_PREFIX/sbin/hadoop-daemon.sh start namenode

$HADOOP_PREFIX/sbin/start-dfs.sh

echo "creating folders"

$HADOOP_PREFIX/bin/hdfs dfs -mkdir /user
$HADOOP_PREFIX/bin/hdfs dfs -mkdir /user/root
$HADOOP_PREFIX/bin/hdfs dfs -mkdir /user/hive
$HADOOP_PREFIX/bin/hdfs dfs -mkdir /user/hive/warehouse
$HADOOP_PREFIX/bin/hdfs dfs -mkdir /tmp
$HADOOP_PREFIX/bin/hdfs dfs -mkdir /tmp/hadoop-yarn
$HADOOP_PREFIX/bin/hdfs dfs -mkdir /tmp/hadoop-yarn/staging
$HADOOP_PREFIX/bin/hdfs dfs -chmod 777 /tmp
$HADOOP_PREFIX/bin/hdfs dfs -chmod 777 /user/hive/warehouse
$HADOOP_PREFIX/bin/hdfs dfs -chmod 777 /tmp/hadoop-yarn
$HADOOP_PREFIX/bin/hdfs dfs -chmod 777 /tmp/hadoop-yarn/staging

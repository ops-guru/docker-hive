# Changelog
All notable changes to this project will be documented in this file.


0.0.2
-----
Major
* conf/dfs.sh Removed $HADOOP_PREFIX/sbin/start-yarn.sh (it is useless here)
* conf/dfs.sh Added $HADOOP_PREFIX/sbin/start-dfs.sh (required)
* conf/dfs.sh Added hdfs dfs -chmod 777 /tmp/hadoop-yarn/staging 
(Required for impersonated Hive user to be able to start Map Reduce)
* conf/run.sh Added $HADOOP_PREFIX/sbin/start-dfs.sh (was missing, required)
* conf/mapres-site.xml added mapreduce.map.memory.mb, mapreduce.map.java.opts, mapreduce.reduce.java.opts.
Otherwise, when MapReduce works it crushes JVM. Even hadoop-mapreduce-examples-2.8.5.jar don't work. See https://community.cloudera.com/t5/Support-Questions/Map-and-Reduce-Error-Java-heap-space/td-p/45874
* Hadoop “Unable to load native-hadoop library for your platform” warning fixed (added ENV LD_LIBRARY_PATH) 
(major performance impact)


Minor
* conf/run.sh copies to /etc/run.sh (and not to root)
* conf/core-site.xml fs.default.name key changed to fs.defaultFS
* conf/hdfs-site.xml dfs.name.dir key changed to fs.namenode.name.dir 
* conf/hdfs-site.xml dfs.data.dir key changed to dfs.datanode.data.dir
* In Dockerfile Added nano
* LICENSE.txt added
* CHANGELOG.md is added
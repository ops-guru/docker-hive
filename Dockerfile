FROM amazonlinux

RUN yum update -y && \
    yum install -y openssh \
    openssh-clients \
    openssh-server \
    which \
    procps \
    tar \
    curl \
    wget \
    net-tools \
    nano

# setup ssh
RUN ssh-keygen -A
RUN ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
COPY conf/ssh_config /root/.ssh/config
RUN chmod 0600 ~/.ssh/authorized_keys ~/.ssh/config

# install java
RUN yum install java-1.8.0-openjdk -y
ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk/
ENV JAVA_PATH $JAVA_HOME
ENV PATH $PATH:$JAVA_HOME/bin

# install hadoop
RUN wget http://apache.claz.org/hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz
RUN tar -xzf hadoop-2.8.5.tar.gz -C /usr/local/
RUN cd /usr/local && ln -s ./hadoop-2.8.5 hadoop
ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_PREFIX $HADOOP_HOME
ENV HADOOP_INSTALL $HADOOP_HOME
ENV HADOOP_MAPRED_HOME $HADOOP_HOME
ENV HADOOP_COMMON_HOME $HADOOP_HOME
ENV HADOOP_HDFS_HOME $HADOOP_HOME
ENV YARN_HOME $HADOOP_HOME
ENV HADOOP_COMMON_LIB_NATIVE_DIR $HADOOP_HOME/lib/native
ENV PATH $PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin

# config hadoop
RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk/:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
COPY conf/core-site.xml /usr/local/hadoop/etc/hadoop/core-site.xml
COPY conf/hdfs-site.xml /usr/local/hadoop/etc/hadoop/hdfs-site.xml
COPY conf/mapred-site.xml /usr/local/hadoop/etc/hadoop/mapred-site.xml
COPY conf/yarn-site.xml /usr/local/hadoop/etc/hadoop/yarn-site.xml

#install hive
RUN wget http://apache.cp.if.ua/hive/hive-2.3.5/apache-hive-2.3.5-bin.tar.gz
RUN tar -xzf apache-hive-2.3.5-bin.tar.gz -C /usr/local/hadoop/
RUN cd /usr/local/hadoop && ln -s ./apache-hive-2.3.5-bin hive
ENV HIVE_HOME $HADOOP_HOME/hive

RUN chown -R root:root /usr/local/hadoop-2.8.5

RUN $HADOOP_PREFIX/bin/hdfs namenode -format
COPY dfs.sh .
RUN ./dfs.sh

COPY run.sh /etc/run.sh

# clean
RUN rm hadoop-2.8.5.tar.gz apache-hive-2.3.5-bin.tar.gz

CMD ["/etc/run.sh"]

# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000
# Mapred ports
EXPOSE 10020 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088
#Hive ports
EXPOSE 10000 10002
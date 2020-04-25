#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias CH="nmcli dev wifi connect 'Miguel' password 'Cantalicio'"
PS1='[\u@\h \W]\$ '
export PATH=/home/miguel/flutter/bin:/home/miguel/pintos/src/utils/:/home/miguel/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
export PDSH_RCMD_TYPE=ssh
source /home/miguel/.config/broot/launcher/bash/br

export HADOOP_HOME="/home/miguel/hadoop"
export PINTOS_HOME="/home/miguel/SO/pintos"
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
export HADOOP_MAPRED_HOME=${HADOOP_HOME}
export HADOOP_COMMON_HOME=${HADOOP_HOME}
export HADOOP_HDFS_HOME=${HADOOP_HOME}
export YARN_HOME=${HADOOP_HOME}

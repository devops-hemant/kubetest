#!/bin/bash

apt update

apt install default-jre 

wget https://dlcdn.apache.org/cassandra/4.0.4/apache-cassandra-4.0.4-bin.tar.gz

tar -xvzf apache-cassandra-4.0.4-bin.tar.gz

mv apache-cassandra-4.0.4 /usr/local/cassandra

useradd cassandra

groupadd cassandra

usermod -aG cassandra cassandra

chown root:cassandra -R /usr/local/cassandra/

chmod g+w -R /usr/local/cassandra/

touch /etc/systemd/system/cassandra.service

tee -a /etc/systemd/system/cassandra.service << END
[Unit]
Description=Cassandra Database Service
After=network-online.target
Requires=network-online.target

[Service]
User=cassandra
Group=cassandra
ExecStart=/usr/local/cassandra/bin/cassandra -f

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
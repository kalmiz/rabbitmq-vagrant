#!/bin/sh

# download and install RabbitMQ
wget -q https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
rpm -Uvh erlang-solutions-1.0-1.noarch.rpm
wget -q https://www.rabbitmq.com/releases/rabbitmq-server/v3.6.5/rabbitmq-server-3.6.5-1.noarch.rpm
rpm --import https://www.rabbitmq.com/rabbitmq-release-signing-key.asc
yum install -y epel-release
yum update
yum install -y erlang rabbitmq-server-3.6.5-1.noarch.rpm

rabbitmq-plugins enable rabbitmq_management
chkconfig rabbitmq-server on
service rabbitmq-server start

rabbitmqctl add_user admin password
rabbitmqctl set_user_tags admin administrator
rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"

# disable firewall
chkconfig iptables off
service iptables stop

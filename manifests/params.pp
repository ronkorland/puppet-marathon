# == Class: marathon::params
#
# Full description of class marathon here.
#
# === Authors
#
# Paul Otto <paul@ottoops.com>
#
# === Copyright
#
# Copyright 2015 Paul Otto.
#
class marathon::params {
  $owner = 'root'
  $group = 'root'
  $marathon_dir = '/etc/marathon'
  $conf_dir = '/etc/marathon/conf'
  $zookeeper = ''
  # Marathon relies on this file
  # config.pp currently assumes that only the last directory level
  # needs to be created - ie: ./mesos - not intended to be a user param
  $zk_conf_dir = '/etc/mesos'
  $zk_conf_file = 'zk'
  $mesos_role = ''
  $event_subscriber = ''
  $http_endpoints = ''
  $task_launch_timeout = ''
}

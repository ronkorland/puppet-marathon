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
  $mesos_role = ''
  $event_subscriber = ''
  $http_endpoints = ''
  $task_launch_timeout = ''
}

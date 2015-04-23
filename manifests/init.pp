# == Class: marathon
#
# This module manages the Marathon framework for Mesos.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the function of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'marathon':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Paul Otto <paul@ottoops.com>
#
# === Copyright
#
# Copyright 2015 Paul Otto.
#
class marathon (
  $owner = $marathon::params::owner,
  $group = $marathon::params::group,
  $marathon_dir = $marathon::params::marathon_dir,
  $conf_dir = $marathon::params::conf_dir,
  $zookeeper = $marathon::params::zookeeper,
  $zk_conf_dir = $marathon::params::zk_conf_dir,
  $zk_conf_file = $marathon::params::zk_conf_file,
  $mesos_role = $marathon::params::mesos_role,
  $event_subscriber = $marathon::params::event_subscriber,
  $http_endpoints = $marathon::params::http_endpoints,
  $task_launch_timeout = $marathon::params::task_launch_timeout
) inherits marathon::params {

  class {'marathon::config':}

}

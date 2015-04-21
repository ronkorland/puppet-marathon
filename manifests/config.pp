# == Class: marathon::config
#
# Manage Marathon configuration files.
#
# === Authors
#
# Paul Otto <paul@ottoops.com>
#
# === Copyright
#
# Copyright 2015 Paul Otto.
#
class marathon::config (
  $ensure = $marathon::ensure,
  $owner = $marathon::owner,
  $group = $marathon::group,
  $marathon_dir = $marathon::marathon_dir,
  $conf_dir = $marathon::conf_dir,
  $mesos_role = $marathon::mesos_role,
  $event_subscriber = $marathon::event_subscriber,
  $http_endpoints = $marathon::http_endpoints,
  $task_launch_timeout = $marathon::task_launch_timeout
) {
  file { [$marathon_dir, $conf_dir]:
    ensure => directory,
    owner  => $owner,
    group  => $group,
  }

  marathon::property {'mesos_role':
    value   => $mesos_role,
    dir     => $conf_dir,
    file    => 'mesos_role',
    require => File[$conf_dir],
  }

  marathon::property {'event_subscriber':
    value   => $event_subscriber,
    dir     => $conf_dir,
    file    => 'event_subscriber',
    require => File[$conf_dir],
  }

  marathon::property {'http_endpoints':
    value   => $http_endpoints,
    dir     => $conf_dir,
    file    => 'http_endpoints',
    require => File[$conf_dir],
  }

  marathon::property {'task_launch_timeout':
    value   => $task_launch_timeout,
    dir     => $conf_dir,
    file    => 'task_launch_timeout',
    require => File[$conf_dir],
  }

}

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
class marathon::config inherits marathon {

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

  # Create directory just in case Mesos is not installed on system
  # Using mkdir -p to both create the entire path AND avoid managing
  # the directory resource because Mesos module should do so.
  exec{"create_zk_directory":
    command => "/bin/mkdir -p ${zk_conf_dir}",
    creates => "${zk_conf_dir}",
  }
  ->
  # Marathon relies on this file
  file { "${zk_conf_dir}/${zk_conf_file}":
    ensure  => 'present',
    content => $zookeeper,
    owner   => $owner,
    group   => $group,
    require => File[$zk_conf_dir],
  }

}

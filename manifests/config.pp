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

  file { [$marathon::marathon_dir, $marathon::conf_dir]:
    ensure => directory,
    owner  => $marathon::owner,
    group  => $marathon::group,
  }

  marathon::property {'mesos_role':
    value   => $marathon::mesos_role,
    dir     => $marathon::conf_dir,
    file    => 'mesos_role',
    require => File[$marathon::conf_dir],
  }

  marathon::property {'event_subscriber':
    value   => $marathon::event_subscriber,
    dir     => $marathon::conf_dir,
    file    => 'event_subscriber',
    require => File[$marathon::conf_dir],
  }

  marathon::property {'http_endpoints':
    value   => $marathon::http_endpoints,
    dir     => $marathon::conf_dir,
    file    => 'http_endpoints',
    require => File[$marathon::conf_dir],
  }

  marathon::property {'task_launch_timeout':
    value   => $marathon::task_launch_timeout,
    dir     => $marathon::conf_dir,
    file    => 'task_launch_timeout',
    require => File[$marathon::conf_dir],
  }

  # Create directory just in case Mesos is not installed on system
  # Using mkdir -p to both create the entire path AND avoid managing
  # the directory resource because Mesos module should do so.
  exec{'create_zk_directory':
    command => "/bin/mkdir -p ${marathon::zk_conf_dir}",
    creates => $marathon::zk_conf_dir,
  }
  ->
  # Marathon relies on this file
  file { "${marathon::zk_conf_dir}/${marathon::zk_conf_file}":
    ensure  => 'present',
    content => $marathon::zookeeper,
    owner   => $marathon::owner,
    group   => $marathon::group,
  }

}

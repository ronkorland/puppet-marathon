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
class marathon::config {

  file { [$marathon::marathon_dir, $marathon::conf_dir]:
    ensure => directory,
    owner  => $marathon::owner,
    group  => $marathon::group,
  }

  marathon::property {'mesos_role':
    value   => $marathon::mesos_role,
    dir     => $marathon::conf_dir,
    require => File[$marathon::conf_dir],
    service => $marathon::service,
  }

  marathon::property {'event_subscriber':
    value   => $marathon::event_subscriber,
    dir     => $marathon::conf_dir,
    require => File[$marathon::conf_dir],
    service => $marathon::service,
  }

  marathon::property {'http_endpoints':
    value   => $marathon::http_endpoints,
    dir     => $marathon::conf_dir,
    require => File[$marathon::conf_dir],
    service => $marathon::service,
  }

  if !empty($marathon::task_launch_timeout) {
    marathon::property {'task_launch_timeout':
      value   => $marathon::task_launch_timeout,
      dir     => $marathon::conf_dir,
      require => File[$marathon::conf_dir],
      service => $marathon::service,
    }
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

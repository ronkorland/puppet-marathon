# == Class: marathon::install
#
# This class manages Marathon package installation.
#
# === Authors
#
# Paul Otto <paul@ottoops.com>
#
# === Copyright
#
# Copyright 2015 Paul Otto.
#
class marathon::install {

  package { 'marathon':
    ensure => $marathon::package_ensure,
    name   => $marathon::package_name,
  }

}
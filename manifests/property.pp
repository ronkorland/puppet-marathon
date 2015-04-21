# == Define: marathon::property
#
# Store configuration in directory structure.
#
# === Parameters
#
# Document parameters here.
#
# [*title*]
#   Filename
#
# [*dir*]
#   Directory name
#
# [*value*]
#   The content for the file
#
# === Authors
#
# Paul Otto <paul@ottoops.com>
#
# === Copyright
#
# Copyright 2015 Paul Otto.
#
define marathon::property (
  $value,
  $dir,
  $service = undef, #service to be notified about property changes
  $file = $title,
) {

  if is_bool($value) {
    $filename = $value ? {
      true => "${dir}/?${file}",
      false => "${dir}/?no-${file}",
    }
    $ensure = 'present'
    $content = ''
  } else {
    $filename = "${dir}/${file}"
    $ensure = empty($value) ? {
      true  => absent,
      false => present,
    }
    $content = $value
  }

  file { $filename:
    ensure  => $ensure,
    content => $content,
    require => File[$dir],
    notify  => $service,
  }

}
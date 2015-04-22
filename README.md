# Marathon Puppet Module

## Overview

This Puppet module manages the Marathon framework for Apache Mesos. It is very 
early, and presently just manages the configuration files.

## Usage

For managing Marathon:

```puppet
class{'marathon':
  marathon_dir  => '/etc/marathon',
  conf_dir => '/etc/marathon/conf',
}
```

### Parameters


## File based configuration

This module writes configuration parameters into files to be read by Marathon. 
Given a key-value pair, the key becomes the filename and the value becomes the 
file content.

## Requirements

  * Puppet > 2.6

## Dependencies

  * [stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib) version `>= 4.2.0`

## Links

For more information see [Marathon project](http://mesosphere.github.io/marathon/)

## License

Apache License 2.0

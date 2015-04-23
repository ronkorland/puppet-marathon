# Marathon Puppet Module

[![Puppet
Forge](http://img.shields.io/puppetforge/v/potto/marathon.svg)](https://forge.puppetlabs.com/potto/marathon) [![Build Status](https://travis-ci.org/potto007/puppet-marathon.png)](https://travis-ci.org/potto007/puppet-marathon)

## Overview

This Puppet module manages the Marathon framework for Apache Mesos. It is very 
early, and presently just manages the configuration files.

## Usage

For managing Marathon:

```puppet
class{'marathon':
  zookeeper  => 'zk://localhost:2181/mesos',
}
```

### Parameters

- `zookeeper` - Zookeeper quorum for Mesos masters -- **Required**
- `marathon_dir` - Base directory for Marathon (default: `/etc/marathon`)
- `conf_dir` - Configuration directory for Marathon (default: `/etc/marathon/conf`)
- `mesos_role` - Mesos role that Marathon should use (default: none)
- `event_subscriber` - event subscriber type: http_callback,none (default: none)
- `http_endpoints` - http endpoint to send event messages to (default: none)
- `task_launch_timeout` - time, in milliseconds, to wait for a task before killing it (default: none)

## File based configuration

This module writes configuration parameters into files to be read by Marathon. 
Given a key-value pair, the key becomes the filename and the value becomes the 
file content.

## Requirements

  * Puppet >= 3.5.1

## Dependencies

  * [stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib) version `>= 4.2.0`

## Links

For more information see [Marathon project](http://mesosphere.github.io/marathon/)

## License

Apache License 2.0

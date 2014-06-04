nginx
===

This module manages the configuration of nginx.

## Description

This apt module is an opinionated refactoring of [puppet-nginx](https://github.com/jfryman/puppet-nginx) which
respects containment, removes external dependencies, and generally cleans up.

## Overview

This module provides an interface for managing nginx and it's configuration. It always runs in the same order:
`package -> configs -> vhosts -> service`

## Usage

While any class contained within this module can be called, it is primarily meant to be called from the parent
class:

### Install nginx package, create nginx.conf, create and enable default vhost, and start service

```
class { 'nginx': }
```

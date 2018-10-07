<!--
# This file is part of the doubledog-sudo Puppet module.
# Copyright 2018 John Florian
# SPDX-License-Identifier: GPL-3.0-or-later
-->

# sudo

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with sudo](#setup)
    * [What sudo affects](#what-sudo-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with sudo](#beginning-with-sudo)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    * [Classes](#classes)
    * [Defined types](#defined-types)
    * [Data types](#data-types)
    * [Facts](#facts)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module lets you manage sudo.

## Setup

### What sudo Affects

### Setup Requirements

### Beginning with sudo

## Usage

## Reference

**Classes:**

* [sudo](#sudo-class)

**Defined types:**

* [sudo::drop\_in](#sudodrop_in-defined-type)

**Data types:**

**Facts:**


### Classes

#### sudo class

This class manages the package installation and primary configuration.

##### `packages` (required)
An array of package names needed for the sudo installation.  The default should be correct for supported platforms.

##### `secure_path` (required)
Path used for every command run from sudo.  The default aims to match that of the supported platforms.


### Defined types

#### sudo::drop\_in defined type

This defined type manages a drop-in configuration file.  This is the preferred way to alter the primary sudo configuration.

##### `namevar` (required)
An arbitrary identifier for the file instance unless the *filename* parameter is not set in which case this must provide the value normally set with the *filename* parameter.

##### `content`
Literal content for the file.  If neither *content* nor *source* is given, the content of the file will be left unmanaged.

##### `ensure`
Instance is to be `'present'` (default) or `'absent'`.  Alternatively, a Boolean value may also be used with `true` equivalent to `'present'` and `false` equivalent to `'absent'`.

##### `filename`
Name to be given to the file, without any path details.  This may be used in place of *namevar* if it's beneficial to give *namevar* an arbitrary value.

##### `source`
URI of the file content.  If neither *content* nor *source* is given, the content of the file will be left unmanaged.


### Data types

### Facts


## Limitations

Tested on modern Fedora and CentOS releases, but likely to work on any Red Hat variant.  Adaptations for other operating systems should be trivial as this module follows the data-in-module paradigm.  See `data/common.yaml` for the most likely obstructions.  If "one size can't fit all", the value should be moved from `data/common.yaml` to `data/os/%{facts.os.name}.yaml` instead.  See `hiera.yaml` for how this is handled.

## Development

Contributions are welcome via pull requests.  All code should generally be compliant with puppet-lint.

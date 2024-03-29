<!--
This file is part of the doubledog-sudo Puppet module.
Copyright 2018-2021 John Florian
SPDX-License-Identifier: GPL-3.0-or-later

Template

## [VERSION] WIP
### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security

-->

# Change log

All notable changes to this project (since v1.0.0) will be documented in this file.  The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org).

## [1.3.0] 2021-09-08
### Added
- CentOS 8 support
- Fedora 32-34 support
- snaps to `secure_path` on Fedora, per their default in sudo-1.9.5p2-1.fc34
### Changed
- freshened sudoers template based on sudo-1.9.5p2-1.fc34
    - this was identical to that used for CentOS, so they've been merged
### Removed
- Fedora 29-31 support

## [1.2.0] 2019-05-29
### Added
- Fedora 30 support
### Changed
- sync `/etc/sudoers` for CentOS with upstream
### Removed
- Fedora 28 support

## [1.1.0] 2019-03-29
### Added
- Fedora 29 support
### Changed
- dependency on `doubledog/ddolib` now expects 1 >= version < 2
### Removed
- Fedora 27 support

## [1.0.0 and prior] 2018-12-15

This and prior releases predate this project's keeping of a formal CHANGELOG.  If you are truly curious, see the Git history.

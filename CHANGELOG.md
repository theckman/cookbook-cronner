# cronner CHANGELOG

This file is used to list changes made in each version of the example cookbook.

## 0.3.4

* install `cronner` `v0.6.1` by default

## 0.3.3

* make sure the `predefined_value` property is passed to the `cron_d` resource

## 0.3.2

* When invoking the `cronner` LWRP with action `:create`, always make sure to include the `cronner::default` recipe. Otherwise, the `cronner` binary may not be installed.

## 0.3.1

* update `README.md` to include information about the `passthru` and `use_parent` properties

## 0.3.0

* install `cronner` v0.5.0 by default
* add support for `--passthru` and `--use-parent` flags

## 0.2.4

* fix issue with invalid flags being rendered

## 0.2.3

* fix source and issues URL in the metadata
* remove unnecessary `format_string()` call

## 0.2.2

* increase default cronner version from `0.4.1` to `0.4.2`

## 0.2.1

* add a detailed README file for the supermarket

## 0.2.0

* add `cronner` LWRP which wraps the `cron_d` LWRP but uses `cronner` to run the command

## 0.1.0

Initial release.

* support installation of `cronner` to `/usr/local/bin`

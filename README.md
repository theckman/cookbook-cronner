# cronner

[![Cookbook Version](https://img.shields.io/cookbook/v/cronner.svg)](https://supermarket.chef.io/cookbooks/cronner)
![ci](https://github.com/theckman/cookbook-cronner/workflows/ci/badge.svg)

The `cronner` cookbook installs [cronner](https://github.com/theckman/cronner)
and provides a custom resource for configuring cron jobs that are wrapped with `cronner`.
The resource is a wrapper of the `cron_d` resource and injects the `cronner` invocation
before your command allowing the status and metrics to be collected.

## License

This cookbook is licensed under the Apache 2.0 License. Please refer to
the [LICENSE](https://github.com/theckman/cookbook-cronner/blob/master/LICENSE)
file for the full contents of the license.

## Recipe Usage

This cookbook intends to try and track all major versions of the `cronner`
binary, to make it easy to switch between versions just with an attribute
change. By default this cookbook uses the latest version if one is not specified
otherwise. To install `cronner`, just execute the `cronner::default` recipe by
including it one of your recipes or by adding it to the `run_list`.

### Recipe Attributes

This cookbook only has one attribute to impact the installation
(`node['cronner']['default_install_version']`), which takes the cronner version
string (e.g., `0.4.2`) that you want to have installed.

## Resource Usage

The `cronner` cookbook provides a custom resource to install cron jobs that are monitored
by `cronner`. This resource is a light wrapper around the stellar `cron_d` resource, originally from
the [cron](https://supermarket.chef.io/cookbooks/cron) cookbook, but now included with Chef. That means the
`cronner` resource has all the same attributes available as the `cron_d` resource. For
information on the `cron_d` resource please see the [documentation](http://docs.chef.io/resource_cron_d.html).

```ruby
cronner 'db_backup' do
  command 'pg_dump ...'
  minute '0'
  hour '23'
  user 'postgres'

  # cronner is meant to replace the usage of mailto to alert you of errors or problems
  # however, it's a good idea to still set it if cronner were to hit its own internal issues
  # this actually happened in an early version of cronner where it would randomly hit a stdlib bug
  mailto 'ops@example.com'

  event true
  lock true
  log_fail true
  event_group 'db_operations'
  metric_group 'db_operations'

  warn_after 60 * 30 # (30 minutes)
  wait_secs_for_lock 60

  action :create # default action
end
```

### Cronner Custom Resource Attributes

The custom resource supports either `:create` or `:delete`.

|Attribute|Description|Default|
|---------|-----------|-------|
|event|Tell cronner to emit an event on job start/stop|false|
|event_fail|Tell cronner to emit an event only on job failure|false|
|log_fail|Tell cronner to log a file on disk with the command output on failure only|false|
|lock|Tell cronner to take a exclusive file lock before running the job|false|
|event_group|The group tag to add to the events emitted|nil|
|metric_group|The group tag to add to the metrics emitted|nil|
|label|The label (name) of the cron job, used for metrics and events|resource_name|
|namespace|The namespace to emit metrics under, the binary uses 'cronner' if this is omitted|nil|
|passthru|Attach the output of the command to the controlling TTY|false|
|use_parent|Tag the events and metrics with the parameters provided by the parent invocation of `cronner`|false|
|sensitive_output|This tells cronner to try and avoid printing the output of the command because it may contain sensitive data|false|
|warn_after|Number of seconds to let cronner run a job before it emits a warning that it's running too long|0 (disabled)|
|wait_secs_for_lock|Tells cronner how long it should wait for the exclusive lock before bailing out|0 (disabled)|

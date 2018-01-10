#
# Cookbook Name:: cronner
# Resource:: cronner
#
# Copyright 2017 Tim Heckman <t@heckman.io>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

resource_name :cronner
default_action :create

property :job_name, String, name_property: true

###
# cron_d Resource properties
#
property :command, String, required: true
property :cookbook, String, default: 'cron'

property :predefined_value, String
property :minute, [String, Integer], default: '*'
property :hour, [String, Integer], default: '*'
property :day, [String, Integer], default: '*'
property :month, [String, Integer], default: '*'
property :weekday, [String, Integer], default: '*'

property :user, String, default: 'root'
property :mailto, [String, NilClass]
property :path, [String, NilClass]
property :home, [String, NilClass]
property :shell, [String, NilClass]
property :comment, [String, NilClass]
property :environment, [Hash, NilClass], default: {}
property :mode, [String, Integer], default: '0644'

###
# cronner properties
#
# flag: -e/--event
property :event, [TrueClass, FalseClass], default: false
# flag: -E/--event-fail
property :event_fail, [TrueClass, FalseClass], default: false
# flag: -F/--log-fail
property :log_fail, [TrueClass, FalseClass], default: false
# flag: -G/--event-group
property :event_group, [String, NilClass], default: nil
# flag: -g/--group
# use name metric_group to avoid colliding with group resource
property :metric_group, [String, NilClass], default: nil
# flag: -k/--lock
property :lock, [TrueClass, FalseClass], default: false
# flag: -l/--label
property :label, [String, NilClass], default: nil
# flag: -N/--namespace
property :namespace, [String, NilClass], default: nil
# flag: -p/--passthru
property :passthru, [TrueClass, FalseClass], default: false
# flag: -P/--use-parent
property :use_parent, [TrueClass, FalseClass], default: false
# flag: -s/--sensitive
# use name sensitive_output to avoid colliding with built-in sensitive property
property :sensitive_output, [TrueClass, FalseClass], default: false
# flag: -w/--warn-after
property :warn_after, Integer, default: 0
# flag: -W/--wait-secs
property :wait_secs_for_lock, Integer, default: 0

# grab format_string and command_string helper methods
include Cronner::Helpers

action :create do
  include_recipe 'cronner'
  include_recipe 'cron'

  cron_d format_string(job_name) do
    command command_string
    cookbook new_resource.cookbook
    minute new_resource.minute
    hour new_resource.hour
    day new_resource.day
    month new_resource.month
    weekday new_resource.weekday
    user new_resource.user
    mailto new_resource.mailto
    path new_resource.path
    home new_resource.home
    shell new_resource.shell
    comment new_resource.comment
    environment new_resource.environment
    mode new_resource.mode
    predefined_value new_resource.predefined_value
    action :create
  end
end

action :delete do
  cron_d format_string(job_name) do
    command command_string
    cookbook new_resource.cookbook
    minute new_resource.minute
    hour new_resource.hour
    day new_resource.day
    month new_resource.month
    weekday new_resource.weekday
    user new_resource.user
    mailto new_resource.mailto
    path new_resource.path
    home new_resource.home
    shell new_resource.shell
    comment new_resource.comment
    environment new_resource.environment
    mode new_resource.mode
    predefined_value new_resource.predefined_value
    action :delete
  end
end

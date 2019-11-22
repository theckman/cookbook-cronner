#
# Cookbook:: cronner_resource_test
# Recipe:: default
#
# Copyright:: 2017 Tim Heckman <t@heckman.io>
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

cronner 'test job' do
  command '/bin/true'
  minute '0'
  hour '12'
  event true
  event_fail true
  log_fail true
  use_parent true
  passthru true
  event_group 'eventgroup'
  metric_group 'metricgroup'
  lock true
  namespace 'testenv'
  sensitive_output true
  warn_after 10
  wait_secs_for_lock
end

cronner 'test job two' do
  command '/bin/true'
  event true
  event_fail true
  log_fail true
  use_parent true
  passthru true
  event_group 'eventgroup'
  metric_group 'metricgroup'
  lock true
  namespace 'testenv'
  sensitive_output true
  warn_after 10
  wait_secs_for_lock
  predefined_value '@hourly'
end

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

module Cronner
  module Helpers
    def format_string(value)
      value.tr(' ', '_')
    end

    def command_string
      label job_name if label.nil? || label.empty?

      c_str = '/usr/local/bin/cronner '

      c_str << "--label=#{format_string(label)} "
      c_str << "--namespace=#{format_string(namespace)} " unless namespace.nil? || namespace.empty?
      c_str << "--event-group=#{format_string(event_group)} " unless event_group.nil? || event_group.empty?
      c_str << "--group=#{format_string(metric_group)} " unless metric_group.nil? || metric_group.empty?

      c_str << "--warn-after=#{warn_after} " if warn_after > 0
      c_str << "--wait-secs=#{wait_secs_for_lock} " if lock && wait_secs_for_lock > 0

      c_str << '--event ' if event
      c_str << '--event-fail ' if event_fail && !event
      c_str << '--log-fail ' if log_fail
      c_str << '--lock ' if lock
      c_str << '--use-parent ' if use_parent
      c_str << '--passthru ' if passthru
      c_str << '--sensitive ' if sensitive_output

      c_str << "-- #{command}"

      c_str
    end
  end
end

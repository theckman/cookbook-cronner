# # encoding: utf-8
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

# Inspec test for cronner resource

describe file('/etc/cron.d/test_job') do
  it { should be_file }
  it { should be_readable }
  its('owner') { should eql 'root' }
  its('group') { should eql 'root' }
  its('content') { should match /^# Crontab for test_job managed by Chef\./ }
  its('content') do
    should match %r(^0 12 \* \* \* root /usr/local/bin/cronner --label=test_job --namespace=testenv --event-group=eventgroup --group=metricgroup --warn-after=10 --event --log-fail --lock --use-parent --passthru --sensitive -- /bin/true$)
  end
end

describe file('/etc/cron.d/test_job_two') do
  it { should be_file }
  it { should be_readable }
  its('owner') { should eql 'root' }
  its('group') { should eql 'root' }
  its('content') { should match /^# Crontab for test_job_two managed by Chef\./ }
  its('content') do
    should match %r(^@hourly root /usr/local/bin/cronner --label=test_job_two --namespace=testenv --event-group=eventgroup --group=metricgroup --warn-after=10 --event --log-fail --lock --use-parent --passthru --sensitive -- /bin/true$)
  end
end

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

default['cronner']['known_versions'].tap do |v|
  v['0.4.1']['linux-amd64']['checksum'] = '11cfc853ea484aac75ebe90cafb9b31f8e8ba6fc58bce4ac11d58c63ab5a02ae'
end

default['cronner']['default_install_version'] = '0.4.1'

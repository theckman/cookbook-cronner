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

default['cronner']['default_install_version'] = '0.6.1'

default['cronner']['known_versions'].tap do |v|
  v['0.4.1']['linux-amd64']['checksum'] = '11cfc853ea484aac75ebe90cafb9b31f8e8ba6fc58bce4ac11d58c63ab5a02ae'
  v['0.4.2']['linux-amd64']['checksum'] = 'd633bb540371e600180011fdf5ffe9c99a8c2d015d78ada00624239af6909a06'
  v['0.5.0']['linux-amd64']['checksum'] = '29de34468bccfaa85c0ce5f1ef887dcd49f1b956625e5deebd44ec0c762f9a4b'
  v['0.6.0']['linux-amd64']['checksum'] = 'fb2703d9ee7cca4d602edf54ca1b30aa6aab39881ddfea2ad7656964029c7abb'
  v['0.6.1']['linux-amd64']['checksum'] = '3e874f0ab4fa6fc76548a33e2b048a84dad408c74c68336b114dc0ef26dad590'
end

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

name 'cronner'
version '0.3.4'
license 'Apache 2.0'
chef_version '>= 12.7'

description 'Installs/Configures cronner'
long_description 'Installs/Configures cronner'

maintainer 'Tim Heckman'
maintainer_email 't@heckman.io'

issues_url 'https://github.com/theckman/cookbook-cronner/issues' if respond_to?(:issues_url)
source_url 'https://github.com/theckman/cookbook-cronner' if respond_to?(:source_url)

depends 'cron', '~> 5.0'

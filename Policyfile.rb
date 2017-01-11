# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name "cronner"

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list "cronner::default"

named_run_list :install, 'cronner::install'
named_run_list :lwrp, 'cronner_lwrp_test'

# Specify a custom source for a single cookbook:
cookbook "cronner", path: "."
cookbook 'cronner_lwrp_test', path: 'test/fixtures/cookbooks/cronner_lwrp_test'
cookbook 'cron', '~> 3.0.0'

default['cron']['package_name'] = 'cron'

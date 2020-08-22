# frozen_string_literal: true
require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |c|
  c.color     = true
  c.formatter = :documentation
  c.platform  = 'ubuntu'
  c.version   = '16.04'
end

if ENV['SIMPLECOV']
  require 'simplecov'
  SimpleCov.start do
    add_filter '_spec.rb'
    add_filter 'spec_helper.rb'
  end
end

require 'rubella'
require 'rubella/storage'
require 'rubella/input/base'
require 'rubella/input/json'
require 'rubella/weighting/base'
require 'rubella/weighting/per_count'
require 'rubella/weighting/per_value'
require 'rubella/weighting/exponential'
require 'rubella/weighting/per_overall_load'
require 'rubella/output/base'
require 'rubella/output/ascii'
require 'rubella/output/image'

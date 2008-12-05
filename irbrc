#!/usr/bin/ruby
require 'irb/completion'
require 'rubygems'
require 'wirble'

ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
Wirble.init
Wirble.colorize

load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']

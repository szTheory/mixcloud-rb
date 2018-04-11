require 'rubygems'
require 'hashie'
require 'httparty'

directory = File.expand_path(File.dirname(__FILE__))

module MixCloud  
  
  VERSION = '0.0.2'
  BASE_URL = 'http://api.mixcloud.com'
    
end

require File.join(directory, 'mixcloud', 'user')
require File.join(directory, 'mixcloud', 'tag')

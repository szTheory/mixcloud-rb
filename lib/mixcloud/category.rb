require 'rubygems'
require 'hashie'
require 'httparty'

module MixCloud

  class Category < Hashie::Dash
    include HTTParty
    format :json
    base_uri MixCloud.base_uri
    
    property :name
    property :url
    property :key
    property :slug
    property :type
    property :format
    property :pictures, :default => {}
    property :metadata, :default => {}
      
    def self.find(category)
      res = self.get("/categories/#{category}?metadata=1")
      self.new res
    end
    
  end
  
end

category = MixCloud::Category.find("ambient")
puts category
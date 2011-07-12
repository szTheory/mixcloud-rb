require 'rubygems'
require 'hashie'
require 'httparty'

module MixCloud

  class Artist < Hashie::Dash
    include HTTParty
    format :json
    base_uri MixCloud::BASE_URL
    
    property :url
    property :name
    property :key
    property :slug
    property :type
    property :metadata,  :default => {}
      
    def self.find(artist)
      res = self.get("/artist/#{artist}?metadata=1")
      self.new res
    end
    
  end
  
end

require 'rubygems'
require 'hashie'
require 'httparty'

module MixCloud
  class Tag < Hashie::Dash
    include HTTParty
    attr_writer :options
    
    format :json
    base_uri MixCloud::BASE_URL
        
    property :url
    property :type
    property :name
    property :key
    property :metadata, :default => {}
    property :data, :default => {}
    property :popular, :default => {}    
        
    def initialize(tag_name, options={})
      @options = options
      @tag = self.class.get("/tag/#{tag_name}", :query => @options)
      
      @tag['metadata']['connections'].each do |k,v|
        @tag['metadata'][k.to_sym] = v
      end      
      @tag['metadata'].delete('connections')
      
      super @tag
    end
    
    def popular(options=nil)      
      options = options ||= @options            
      self.popular = self.class.get("#{self[:key]}popular/", :query => options)
    end
    
  end  
end

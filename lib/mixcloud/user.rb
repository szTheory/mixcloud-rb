require 'rubygems'
require 'hashie'
require 'httparty'

module MixCloud
  class User < Hashie::Dash
    include HTTParty
    attr_writer :options
    
    format :json
    base_uri MixCloud::BASE_URL
      
    property :username
    property :city
    property :cloudcast_count
    property :following_count              
    property :url          
    property :pictures, :defaul => {}            
    property :listen_count
    property :updated_time
    property :created_time           
    property :biog
    property :key
    property :country
    property :follower_count                      
    property :favorite_count
    property :country 
    property :name
    property :type
    property :metadata, :default => {}
            
    def initialize(user_name, options={})
      @options = options
      @user = self.class.get("/#{user_name}?metadata=1", :query => @options)

      @user['metadata']['connections'].each do |k,v|
        @user['metadata'][k.to_sym] = v
      end
      @user['metadata'].delete('connections')
      
      @user['metadata'].each do |k,v|
        self.class.send(:define_method, "#{k}".downcase) do |options|
          options = options ||= @options                  
          self.class.get("#{self.metadata[k.to_sym]}", :query => @options)          
         end
      end
            
      super @user
    end
    
    def self.find(user_name, options={})
      self.new user_name, options
    end

  end  
end

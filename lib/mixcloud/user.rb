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
    property :favorite_count
    property :name
    property :following_count
    property :url
    property :pictures, :default => {}
    property :listen_count
    property :updated_time
    property :is_premium
    property :created_time
    property :cover_pictures
    property :biog
    property :key
    property :country
    property :follower_count
    property :picture_primary_color
    property :is_pro
    property :cloudcast_count
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
        self.send(:define_singleton_method, "#{k}".downcase) do |opts={}|
          self.class.get("#{self.metadata[k.to_sym]}", :query => opts || @options)          
        end
      end
            
      super @user
    end
    
    def self.find(user_name, options={})
      self.new user_name, options
    end
  end  
end

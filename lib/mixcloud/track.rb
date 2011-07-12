module MixCloud

  class Track < Hashie::Dash
    include HTTParty
    base_uri 'http://api.mixcloud.com/'    
  end  
end
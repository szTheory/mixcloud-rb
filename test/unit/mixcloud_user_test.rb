require_relative "./test_helper.rb"

class TestMixCloudUser < Test::Unit::TestCase

  USERNAME = 'spartacus'
  USER_HUMANIZED = 'Spartacus'
 
  def setup
    VCR.use_cassette("user") do
      @user = MixCloud::User.find(USERNAME, { :limit => 1, :offset => 1, :metadata => 1 } )
    end
    VCR.use_cassette("feed") do
      @user_feed = @user.feed
    end
    VCR.use_cassette("comments") do
      @user_comments = @user.comments
    end
    VCR.use_cassette("cloudcasts") do
      @user_cloudcasts = @user.cloudcasts
    end
    VCR.use_cassette("followers") do
      @user_followers = @user.followers
    end
    VCR.use_cassette("following") do
      @user_following = @user.following    
    end
    VCR.use_cassette("favorites") do
      @user_favorites = @user.favorites
    end
    VCR.use_cassette("listens") do
      @user_listens = @user.listens
    end
  end  
 
  def test_user_properties        
    assert_equal(USERNAME, @user.username)
    assert_equal('London', @user.city)
    assert_block { @user.cloudcast_count.is_a?(Fixnum) }
    assert_block { @user.following_count.is_a?(Fixnum) }
    assert_equal("https://www.mixcloud.com/#{USERNAME}/", @user.url)    
    assert_block { @user.pictures.length.is_a?(Fixnum) }
    assert_block { @user.listen_count.is_a?(Fixnum) }
    assert_equal("Part of the Mixcloud team - since Mixcloud was just a good idea.", @user.biog, )
    assert_equal("/#{USERNAME}/", @user.key)    
    assert_equal("United Kingdom", @user.country)
    assert_equal('user', @user.type)
    assert_equal(USER_HUMANIZED, @user.name)  
  end
  
  def test_user_has_metadata
    assert_block { @user.metadata.size.is_a?(Fixnum) }
  end
  
  def test_user_metadata_properties
    assert_equal(MixCloud::BASE_URL + "/#{USERNAME}/feed/", @user.metadata[:feed])    
    assert_equal(MixCloud::BASE_URL + "/#{USERNAME}/comments/", @user.metadata[:comments])            
    assert_equal(MixCloud::BASE_URL + "/#{USERNAME}/followers/", @user.metadata[:followers])
    assert_equal(MixCloud::BASE_URL + "/#{USERNAME}/favorites/", @user.metadata[:favorites])
    assert_equal(MixCloud::BASE_URL + "/#{USERNAME}/following/", @user.metadata[:following])
    assert_equal(MixCloud::BASE_URL + "/#{USERNAME}/listens/", @user.metadata[:listens])                    
  end
  
  def test_user_feed_properties
    assert_block { @user_feed['data'].length.is_a?(Fixnum) }
    assert_equal("https://www.mixcloud.com/#{USERNAME}/", @user_feed['data'][0]['from']['url'])    
  end
  
  def test_user_comments_properties    
    assert_block do
      @user_comments['paging']['previous'].include?("#{MixCloud::BASE_URL}/#{USERNAME}/comments/?limit=20&since=")
    end
    assert_block do
      @user_comments['paging']['next'].include?("#{MixCloud::BASE_URL}/#{USERNAME}/comments/?limit=20&until=")
    end
    assert_equal(false, @user_comments['data'].nil?)        
    assert_equal("Comments on #{USER_HUMANIZED}\'s profile", @user_comments['name'])    
  end
  
  def test_user_followers_properties
    assert_block do
      @user_followers['paging']['previous'].include?("#{MixCloud::BASE_URL}/#{USERNAME}/followers/?limit=20&since=")
    end
    assert_block do
      @user_followers['paging']['next'].include?("#{MixCloud::BASE_URL}/#{USERNAME}/followers/?limit=20&until=")
    end
    assert_equal(false, @user_followers['data'].nil?)          
    assert_equal("#{USER_HUMANIZED}\'s followers", @user_followers['name'])    
  end
  
  def test_user_favorites_properties
    assert_block do
      @user_favorites['paging']['previous'].include?("#{MixCloud::BASE_URL}/#{USERNAME}/favorites/?limit=20&since=")
    end
    assert_block do
      @user_favorites['paging']['next'].include?("#{MixCloud::BASE_URL}/#{USERNAME}/favorites/?limit=20&until=")
    end
    assert_equal(false, @user_favorites['data'].nil?)
    assert_equal("#{USER_HUMANIZED}\'s favorites", @user_favorites['name'])
  end
  
  def test_user_following_properties
    assert_block do
      @user_following['paging']['previous'].include?("#{MixCloud::BASE_URL}/#{USERNAME}/following/?limit=20&since=")
    end
    assert_block do
      @user_following['paging']['next'].include?("#{MixCloud::BASE_URL}/#{USERNAME}/following/?limit=20&until=")
    end
    assert_equal(false, @user_following['data'].nil?)
  end
  
  def test_user_cloudcasts_properties
    assert_block do
      @user_cloudcasts['paging']['previous'].include?("#{MixCloud::BASE_URL}/#{USERNAME}/cloudcasts/?limit=20&since=")
    end
    assert_equal(false, @user_cloudcasts['data'].nil?)      
    assert_equal("#{USER_HUMANIZED}\'s Cloudcasts", @user_cloudcasts['name'])
  end
  
  def test_user_listens_properties
    assert_block do
      @user_listens['paging']['previous'].include?("#{MixCloud::BASE_URL}/#{USERNAME}/listens/?limit=20&since=")
    end
    assert_block do
      @user_listens['paging']['next'].include?("#{MixCloud::BASE_URL}/#{USERNAME}/listens/?limit=20&until=")
    end
    assert_equal(false, @user_listens['data'].nil?)       
    assert_equal("#{USER_HUMANIZED}\'s listens", @user_listens['name'])    
  end
    
end
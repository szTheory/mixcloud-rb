require "mixcloud"
require "test/unit"
 
class TestMixCloudUser < Test::Unit::TestCase
 
  def setup
    @user = MixCloud::User.find("spartacus", { :limit => 1, :offset => 1, :metadata => 1 } )
    @user_feed = @user.feed
    @user_comments = @user.comments
    @user_followers = @user.followers
    @user_following = @user.following    
    @user_favorites = @user.favorites
    @user_cloudcasts = @user.cloudcasts
    @user_listens = @user.listens
  end  
 
  def test_user_properties        
    assert_equal(@user.username, "spartacus")
    assert_equal(@user.city,  'London')
    assert_equal(@user.cloudcast_count, 3)
    assert_equal(@user.following_count, 26)
    assert_equal(@user.url,  'http://www.mixcloud.com/spartacus/')    
    assert_equal(@user.pictures.length, 6)
    assert_equal(@user.listen_count, 373)
    assert_equal(@user.biog, "Part of the Mixcloud team - since Mixcloud was just a good idea.")
    assert_equal(@user.key,  '/spartacus/')    
    assert_equal(@user.country, "United Kingdom")
    assert_equal(@user.type, 'user')
    assert_equal(@user.name, 'Spartacus')    
  end
  
  def test_user_has_metadata
    assert_equal(@user.metadata.size, 7)    
  end
  
  def test_user_metadata_properties
    assert_equal(@user.metadata[:feed], MixCloud::BASE_URL + '/spartacus/feed/' )    
    assert_equal(@user.metadata[:comments], MixCloud::BASE_URL + '/spartacus/comments/' )            
    assert_equal(@user.metadata[:followers], MixCloud::BASE_URL + '/spartacus/followers/' )
    assert_equal(@user.metadata[:favorites], MixCloud::BASE_URL + '/spartacus/favorites/' )
    assert_equal(@user.metadata[:following], MixCloud::BASE_URL + '/spartacus/following/' )
    assert_equal(@user.metadata[:listens], MixCloud::BASE_URL + '/spartacus/listens/' )                    
  end
  
  def test_user_feed_properties
    assert_equal(@user_feed['data'].length, 1)
    assert_equal(@user_feed['data'][0]['from']['url'], 'http://www.mixcloud.com/spartacus/')    
  end
  
  def test_user_comments_properties    
    assert_equal(@user_comments['paging']['previous'],'http://api.mixcloud.com/spartacus/comments/?metadata=1&limit=1&offset=0')    
    assert_equal(@user_comments['paging']['next'],'http://api.mixcloud.com/spartacus/comments/?metadata=1&limit=1&offset=2')

    assert_equal(@user_comments['data'].nil?, false)        
    assert_equal(@user_comments['name'],'Comments on Spartacus\'s profile')    
  end
  
  def test_user_followers_properties
    assert_equal(@user_followers['paging']['previous'],'http://api.mixcloud.com/spartacus/followers/?metadata=1&limit=1&offset=0')    
    assert_equal(@user_followers['paging']['next'],'http://api.mixcloud.com/spartacus/followers/?metadata=1&limit=1&offset=2')            
    assert_equal(@user_followers['data'].nil?, false)          
    assert_equal(@user_followers['name'],'Spartacus\'s followers')    
  end
  
  def test_user_favorites_properties
    assert_equal(@user_favorites['paging']['previous'],'http://api.mixcloud.com/spartacus/favorites/?metadata=1&limit=1&offset=0')    
    assert_equal(@user_favorites['paging']['next'],'http://api.mixcloud.com/spartacus/favorites/?metadata=1&limit=1&offset=2')        
    assert_equal(@user_favorites['data'].nil?, false)
    assert_equal(@user_favorites['name'],'Spartacus\'s favorites')
  end
  
  def test_user_following_properties
    assert_equal(@user_following['paging']['previous'],'http://api.mixcloud.com/spartacus/following/?metadata=1&limit=1&offset=0')    
    assert_equal(@user_following['paging']['next'],'http://api.mixcloud.com/spartacus/following/?metadata=1&limit=1&offset=2')
    assert_equal(@user_following['data'].nil?, false)
  end
  
  def test_user_cloudcasts_properties
    assert_equal(@user_cloudcasts['paging']['previous'],'http://api.mixcloud.com/spartacus/cloudcasts/?metadata=1&limit=1&offset=0')            
    assert_equal(@user_cloudcasts['data'].nil?, false)      
    assert_equal(@user_cloudcasts['name'],'Spartacus\'s Cloudcasts')
  end
  
  def test_user_listens_properties
    assert_equal(@user_listens['paging']['previous'],'http://api.mixcloud.com/spartacus/listens/?metadata=1&limit=1&offset=0')    
    assert_equal(@user_listens['paging']['next'],'http://api.mixcloud.com/spartacus/listens/?metadata=1&limit=1&offset=2')            
    assert_equal(@user_listens['data'].nil?, false)       
    assert_equal(@user_listens['name'],'Spartacus\'s listens')    
  end
    
end
require "mixcloud"
require "test/unit"
 
class TestMixCloudTag < Test::Unit::TestCase
 
  def setup
    @tag = MixCloud::Tag.new("funk", {:limit => 1, :offset=> 1, :metadata => 1})        
  end  
 
  def test_tag_properties    
    assert_equal(@tag.url,  'http://www.mixcloud.com/tag/funk/')
    assert_equal(@tag.type, 'tag')
    assert_equal(@tag.name, 'Funk')
    assert_equal(@tag.key,  '/tag/funk/')       
  end
  
  def test_tag_has_metadata
    assert_equal(@tag.metadata.size, 3 )    
  end
  
  def test_tag_metadata_properties
    assert_equal(@tag.metadata[:popular], MixCloud::BASE_URL + '/tag/funk/popular/' )    
    assert_equal(@tag.metadata[:new], MixCloud::BASE_URL + '/tag/funk/new/' )            
  end
  
  
  def test_tag_popular
    assert_equal(@tag.popular.length, 3)
  end
  
  def test_tags_pagination
    assert_equal(@tag.popular['paging']['previous'], MixCloud::BASE_URL + '/tag/funk/popular/?metadata=1&limit=1&offset=0' )
    assert_equal(@tag.popular['paging']['next'], MixCloud::BASE_URL + '/tag/funk/popular/?metadata=1&limit=1&offset=2' )        
  end

end
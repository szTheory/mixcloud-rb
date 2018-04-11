require_relative "./test_helper.rb"

class TestMixCloudTag < Test::Unit::TestCase

  TAG = 'funk'
  TAG_HUMANIZED = 'Funk'
 
  def setup
    VCR.use_cassette("tag") do
      @tag = MixCloud::Tag.new(TAG, {:limit => 1, :offset=> 1, :metadata => 1})        
    end
  end  
 
  def test_tag_properties    
    assert_equal("https://www.mixcloud.com/discover/#{TAG}/", @tag.url)
    assert_equal('tag', @tag.type)
    assert_equal(TAG_HUMANIZED, @tag.name)
    assert_equal("/discover/#{TAG}/", @tag.key)       
  end
  
  def test_tag_has_metadata
    assert_block { @tag.metadata.size.is_a?(Fixnum) }
  end
  
  def test_tag_metadata_properties
    VCR.use_cassette("metadata") do
      assert_equal(MixCloud::BASE_URL + "/tag/#{TAG}/popular/", @tag.metadata[:popular])    
      assert_equal(MixCloud::BASE_URL + "/tag/#{TAG}/new/", @tag.metadata[:new])            
    end
  end
  
  
  def test_tag_popular
    VCR.use_cassette("popular") do
      assert_block { @tag.popular.length.is_a?(Fixnum) }
    end
  end
  
  def test_tags_pagination
    VCR.use_cassette("popular") do
      assert_equal(MixCloud::BASE_URL + "/discover/#{TAG}/popular/?limit=1&metadata=1&offset=0", @tag.popular['paging']['previous'])
      assert_equal(MixCloud::BASE_URL + "/discover/#{TAG}/popular/?limit=1&metadata=1&offset=2", @tag.popular['paging']['next'])        
    end
  end

end
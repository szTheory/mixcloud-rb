require "mixcloud"
require "test/unit"
 
class TestMixCloudArtist < Test::Unit::TestCase
 
  def setup
    artist_name = "aphex-twin"
    @artist = MixCloud::Artist.find("aphex-twin");
  end  
 
  def test_artist_properties    
    assert_equal(@artist.name, "Aphex Twin")
    assert_equal(@artist.key, "/artist/aphex-twin/")
    assert_equal(@artist.slug,"aphex-twin")
    assert_equal(@artist.url, "http://www.mixcloud.com/artist/aphex-twin/")
    assert_equal(@artist.type, "artist")
  end
  
  def test_artist_has_metadata
    assert_equal(@artist.metadata.size, 1 )
  end
  
  def test_artist_metadata_properties
    assert_equal(@artist.metadata["connections"]["popular"], MixCloud::BASE_URL + "/artist/aphex-twin/popular/")
    assert_equal(@artist.metadata["connections"]["new"], MixCloud::BASE_URL + "/artist/aphex-twin/new/")
  end
  
end

require 'test/unit'

require 'easytag'

TEST_DIR = File.dirname(File.absolute_path(__FILE__)) << File::SEPARATOR

class TestNoTagsMP4 < Test::Unit::TestCase
  def setup
    @f = EasyTag::File.new("#{TEST_DIR}no_tags.m4a")
  end

  def test_tags
    assert_equal('',    @f.title)
    assert_equal('',    @f.artist)
    assert_equal('',    @f.album)
    assert_equal('',    @f.album_artist)
    assert_equal([],     @f.comments)
    assert_equal('',    @f.genre)
    assert_equal(0,      @f.year)
    assert_equal(nil,    @f.date)
    assert_equal(true,   @f.album_art.empty?)
    assert_equal('',    @f.apple_id)
    assert_equal([0, 0], @f.track_num)
    assert_equal([0, 0], @f.disc_num)
  end

end

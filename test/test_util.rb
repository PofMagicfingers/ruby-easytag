require 'test/unit'

require 'easytag/util'

class TestUtilities < Test::Unit::TestCase
  def test_get_datetime01
    date = EasyTag::Utilities.get_datetime('2006')
    assert_equal(2006, date.year)
    assert_equal(1, date.month)
    assert_equal(1, date.day)
  end

  def test_get_datetime02
    date = EasyTag::Utilities.get_datetime('1955-05')
    assert_equal(1955, date.year)
    assert_equal(5, date.month)
    assert_equal(1, date.day)
  end

  def test_get_datetime03
    date = EasyTag::Utilities.get_datetime('2012-12-07T08:00:00Z')
    assert_equal(2012, date.year)
    assert_equal(12, date.month)
    assert_equal(7, date.day)
  end

  def test_get_datetime04
    date = EasyTag::Utilities.get_datetime('19880711')
    assert_equal(1988, date.year)
    assert_equal(11, date.month)
    assert_equal(7, date.day)
  end

  def test_get_datetime05
    date = EasyTag::Utilities.get_datetime('')
    assert_equal(nil, date)
  end

  def test_get_datetime06
    date = EasyTag::Utilities.get_datetime('2000-00-00')
    assert_equal(2000, date.year)
    assert_equal(1, date.month)
    assert_equal(1, date.day)
  end

  def test_get_datetime07
    date = EasyTag::Utilities.get_datetime('2006-99-99')
    assert_equal(2006, date.year)
    assert_equal(1, date.month)
    assert_equal(1, date.day)
  end


  def test_get_int_pair
    assert_equal([0, 0],  EasyTag::Utilities.get_int_pair(''))
    assert_equal([0, 0],  EasyTag::Utilities.get_int_pair(nil))
    assert_equal([3, 0],  EasyTag::Utilities.get_int_pair('3'))
    assert_equal([0, 9],  EasyTag::Utilities.get_int_pair('/9'))
    assert_equal([5, 10], EasyTag::Utilities.get_int_pair('5/10'))
  end

  def test_normalize_string
    cases = [
    ['MusicBrainz Album Artist Id', 'musicbrainz_album_artist_id'],
    ['\'hi ^''$there #guys\"', 'hi_there_guys'],
    ]
    cases.each do |c|
      orig, result = c
      assert_equal(result, EasyTag::Utilities.normalize_string(orig))
    end
  end
end

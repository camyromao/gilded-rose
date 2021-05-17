require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'

class TestUntitled < Test::Unit::TestCase

  def test_foo
    items = [Item.new("foo", 0, 0)]
    GildedRose.new(items).update_quality()
    assert_equal items[0].name, "foo"
  end

  def test_sulfuras
    items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 1)]
    GildedRose.new(items).update_quality()
    assert_equal items[0].sell_in, 0
    assert_equal items[0].quality, 1
  end

  def test_negative_quality
    items = [Item.new("Mouse", 1, 0)]
    GildedRose.new(items).update_quality()
    assert_equal items[0].quality, 0
  end

  def test_aged_brie
    items = [Item.new("Aged Brie", 2, 5)]
    GildedRose.new(items).update_quality()
    assert_equal items[0].quality, 6
    assert_equal items[0].sell_in, 1
  end

  def test_aged_brie_quality_over_50
    items = [Item.new("Aged Brie", 2, 50)]
    GildedRose.new(items).update_quality()
    assert_equal items[0].quality, 50
    assert_equal items[0].sell_in, 1
  end

  def test_quality_after_sell_in_expires
    items = [Item.new("Mouse", 0, 6)]
    GildedRose.new(items).update_quality()
    assert_equal items[0].quality, 4
  end

  def test_aged_brie_quality_after_sell_in_expires
    items = [Item.new("Aged Brie", 0, 6)]
    GildedRose.new(items).update_quality()
    assert_equal items[0].quality, 8
  end

  def test_backstage_passes_quality_when_sell_in_lt_10
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 9, 3)]
    GildedRose.new(items).update_quality()
    assert_equal items[0].quality, 5
  end

  def test_backstage_passes_quality_when_sell_in_lt_5
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 3)]
    GildedRose.new(items).update_quality()
    assert_equal items[0].quality, 6
  end

  def test_backstage_passes_quality_when_sell_in_lt_0
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 3)]
    GildedRose.new(items).update_quality()
    assert_equal items[0].quality, 0
  end

end
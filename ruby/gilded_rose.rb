class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

      case item.name
      when "Aged Brie"
        return brie_rule(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        return backstage_rule(item)
      when "Sulfuras, Hand of Ragnaros"
        return sulfuras_rule(item)
      else
        return default_rule(item)
      end

      item.quality = 0 if item.quality < 0
      item.sell_in -= 1
    end
  end

  #     if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert" #pq a qualidade deles aumenta diferente
  #       if item.quality > 0
  #         if item.name != "Sulfuras, Hand of Ragnaros"
  #           item.quality = item.quality - 1
  #         end
  #       end
  #     else
  #       if item.quality < 50
  #         item.quality = item.quality + 1
  #         if item.name == "Backstage passes to a TAFKAL80ETC concert"
  #           if item.sell_in < 11
  #             if item.quality < 50
  #               item.quality = item.quality + 1
  #             end
  #           end
  #           if item.sell_in < 6
  #             if item.quality < 50
  #               item.quality = item.quality + 1
  #             end
  #           end
  #         end
  #       end
  #     end
  #     if item.name != "Sulfuras, Hand of Ragnaros"
  #       item.sell_in = item.sell_in - 1
  #     end
  #     if item.sell_in < 0
  #       if item.name != "Aged Brie"
  #         if item.name != "Backstage passes to a TAFKAL80ETC concert"
  #           if item.quality > 0
  #             if item.name != "Sulfuras, Hand of Ragnaros"
  #               item.quality = item.quality - 1
  #             end
  #           end
  #         else
  #           item.quality = item.quality - item.quality
  #         end
  #       else
  #         if item.quality < 50
  #           item.quality = item.quality + 1
  #         end
  #       end
  #     end
  #   end
  # end

  def brie_rule(item) #nome, sell_in, quality
    item.quality += 1 if item.quality < 50
  end

  def backstage_rule(item)
    item.quality += 1
    if item.sell_in < 11 
      item.quality += 1
    end

    if item.sell_in < 6
      item.quality += 1
    end

    if item.sell_in == 0
      item.quality = 0
    end

    item.quality = 50 if item.quality > 50
  end

  def sulfuras_rule(item)
    item.quality = 80
  end

  def default_rule(item)
    item.quality -= 1
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

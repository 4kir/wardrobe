require "wardrobe"

describe "Wardrobe" do
  before (:all) do 
    @items = Wardrobe.new([
      ClothesItem.new("Вязаная шапка", "Головной убор", -15, 5),
      ClothesItem.new("Дубленка", "Верхняя одежда", -25, -5),
      ClothesItem.new("Кепка", "Головной убор", 15, 35)
    ])
  end

  describe ".from_dir" do
    it "Returns quantity of clothes in wardrobe" do
      wardrobe = Wardrobe.from_dir("#{__dir__}/fixtures")
      expect(wardrobe.clothes.count).to eq 3
    end
  end

  describe ".for_weather" do
    it "Returns clothes suitable for the temperature" do
      expect(@items.for_weather(-5).clothes.map(&:name)).to contain_exactly("Вязаная шапка", "Дубленка")
    end
  end

  describe ".for_type" do
    it "Returns one type clothes" do
      expect(@items.for_type("Головной убор").clothes.map(&:name)).to contain_exactly("Кепка", "Вязаная шапка")
    end
  end

  describe ".types" do
    it "Returns unique type of clothing" do
      expect(@items.types).to contain_exactly("Верхняя одежда", "Головной убор")
    end
  end
end

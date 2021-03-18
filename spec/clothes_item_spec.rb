require "clothes_item"

describe "ClothesItem" do
  before (:all) do
    @clothes_item = ClothesItem.from_file("#{__dir__}/fixtures/test.txt")
  end

  it "Returns good instance variables" do
    expect(@clothes_item.name).to eq "Вязаная шапка"
    expect(@clothes_item.type).to eq "Головной убор"
    expect(@clothes_item.min_temp).to eq -15
    expect(@clothes_item.max_temp).to eq 5
  end

  describe ".suitable_for_temperature?" do
    it "Must return true" do
      expect(@clothes_item.suitable_for_temperature?(2)).to be true
    end

    it "Must return false" do
      expect(@clothes_item.suitable_for_temperature?(10)).to be false
    end
  end

  describe "to_s" do
    it "Returns string with self data" do
      expect(@clothes_item.to_s).to eq "Вязаная шапка (Головной убор) -15..5"
    end
  end
end

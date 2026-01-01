class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price_in_bdt, :description, :stock

  def price_in_bdt
    "#{object.price} Taka"
  end
end

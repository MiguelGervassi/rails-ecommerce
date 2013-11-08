class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def increment(attribute, by = 1)
    self[attribute] ||= 0
  	self[attribute] += by
  	self
  end

  def full_price
    product.price*quantity
  end
end

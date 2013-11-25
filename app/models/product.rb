class Product < ActiveRecord::Base
	has_one :gallery, :dependent => :destroy
	has_many :photos, :through => :gallery
	has_many :line_items, :dependent => :destroy
	before_destroy :ensure_not_referenced_by_any_line_item
	accepts_nested_attributes_for :gallery
	
	private

	# ensure that there are no line items referencing this product
		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line Items present')
				return false
			end
		end

	  def self.latest
			order('created_at DESC').limit(10)
		end
end

class Gallery < ActiveRecord::Base
  validates :product, :presence => true
  belongs_to :product
  has_many :photos, :dependent => :destroy
  # before_destroy :ensure_not_referenced_by_product
  accepts_nested_attributes_for :photos
end
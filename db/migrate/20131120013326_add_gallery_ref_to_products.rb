class AddGalleryRefToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :gallery, index: true
  end

  def self.down
    remove_reference :products, :gallery, index: true
  end
end

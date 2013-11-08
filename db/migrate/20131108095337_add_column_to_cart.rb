class AddColumnToCart < ActiveRecord::Migration
  def change
    add_column :carts, :purchased_at, :datetime
  end

  def down
  	remove_column :carts, :purchased_at, :datetime
  end
end

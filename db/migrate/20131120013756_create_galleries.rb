class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.references :product, index: true

      t.timestamps
    end
  end
end

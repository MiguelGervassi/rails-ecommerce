class AddAttachmentPhotoToProducts < ActiveRecord::Migration
  # reverse this when needed
  def self.down
    change_table :products do |t|
      t.attachment :photo
    end
  end

  def self.up
    drop_attached_file :products, :photo
  end
end

class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :image
      t.text :article
      t.string :tag
      t.string :author
      t.integer :author_id
      t.timestamps
    end
  end
end

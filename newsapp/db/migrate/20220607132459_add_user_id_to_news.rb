class AddUserIdToNews < ActiveRecord::Migration[7.0]
  def change
    add_column :news, :user_id, :integer
  end
end

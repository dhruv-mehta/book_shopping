class AddColumnnameToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :is_admin, :boolean , default: false
  end
end

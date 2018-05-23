class CreateAdminUsersPagesJoin < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_users_pages, :id => false do |t|
      t.references :admin_user, foreign_key: true
      t.references :page, foreign_key: true 
    end
  end
end

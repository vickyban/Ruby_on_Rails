class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|  # yield table (t)
      t.column "firstName", :string, :limit => 25
      t.string "lastName"  ,:limit => 50        #short hand syntax
      t.string "email", :default => "", :null => false
      t.string "password", :limit => 40

      t.timestamps
      # t.datetime "created_at"
      # t.datetime "updated_at"
    end
  end

  def down
    drop_table :users
  end

end

class CreatePages < ActiveRecord::Migration[5.1]
  def up
    create_table :pages do |t|
      t.references :subject, foreign_key: true
      t.string :name
      t.integer :permalink
      t.integer :position
      t.boolean :visible

      t.timestamps
    end
    
    add_index("pages","permalink")    #if user it to look up => good to have index
  end

  def down
    drop_table :pages
  end
end

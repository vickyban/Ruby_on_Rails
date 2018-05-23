class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :position
      t.boolean :visible

      t.timestamps
    end
  end
end

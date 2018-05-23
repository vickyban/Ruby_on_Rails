class CreateSectionEdits < ActiveRecord::Migration[5.1]
  def change
    create_table :section_edits do |t|
      t.references :admin_user, foreign_key: true
      t.references :section, foreign_key: true
      t.string :summary

      t.timestamps
    end
  end
end

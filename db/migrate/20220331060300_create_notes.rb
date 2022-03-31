class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.text :title,                        null: false
      t.text :text, limit: 4294967295,      null: false
      t.timestamps
    end
  end
end

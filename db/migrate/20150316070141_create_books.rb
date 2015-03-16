class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author

      t.timestamps null: false
    end
     add_foreign_key :books, :tags
  end
end

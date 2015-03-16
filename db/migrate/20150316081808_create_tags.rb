class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.text :name
      t.references :book, index: true

      t.timestamps null: false
    end
    add_foreign_key :tags, :books
  end
end

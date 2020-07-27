class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :color
      t.string :icon
      t.belongs_to :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end

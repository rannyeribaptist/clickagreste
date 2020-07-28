class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :tax_id
      t.string :picture
      t.string :description
      t.integer :priority, default: 0

      t.timestamps
    end
  end
end

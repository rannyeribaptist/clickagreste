class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :neighbohood
      t.string :city
      t.string :number
      t.string :zip_code
      t.string :complement
      t.belongs_to :user

      t.timestamps
    end
  end
end

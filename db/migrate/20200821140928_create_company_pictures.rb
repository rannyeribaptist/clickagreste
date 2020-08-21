class CreateCompanyPictures < ActiveRecord::Migration[6.0]
  def change
    create_table :company_pictures do |t|
      t.belongs_to :company, null: false, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end

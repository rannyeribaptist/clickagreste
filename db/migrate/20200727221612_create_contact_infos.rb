class CreateContactInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_infos do |t|
      t.string :name
      t.string :icon
      t.belongs_to :company, null: false, foreign_key: true
      t.string :contact

      t.timestamps
    end
  end
end

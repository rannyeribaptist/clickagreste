class AddCompanyToAddress < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :company, null: false, foreign_key: true
  end
end

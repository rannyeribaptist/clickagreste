class AddSocialMediaToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :facebook, :string
    add_column :companies, :instagram, :string
    add_column :companies, :whatsapp, :string
  end
end

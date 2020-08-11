class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :validate_user_permission

  validates_presence_of :name, :social_security_number, on: :update

  has_many :favorites, dependent: :destroy

  def validate_user_permission
    if User.where(:admin => true).any?
      self.errors.add(:permission, "Sua permissão é invalida")
      throw(:abort)
    end
  end
end

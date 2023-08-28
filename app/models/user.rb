class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :email, presence: true
  validates_uniqueness_of :username
  has_one :grocery_list
  has_one :food_inventory

  # Avatar
  has_one_attached :avatar

  def has_inventory
    return self.food_inventory.present?
  end

  ## Validations for Avatar
  #   validates :avatar, file_size: { less_than_or_equal_to: 5.megabytes },
  #                      file_content_type: { allow: ["image/jpeg", "image/png", "image/gif"] }
end

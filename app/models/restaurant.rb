class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  validates :store_name, presence: true
  validates :tel,        presence: true
  validates :address,    presence: true
end

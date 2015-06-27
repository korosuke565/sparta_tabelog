class Restaurant < ActiveRecord::Base
  validates :store_name, presence: true
  validates :tel,        presence: true
  validates :address,    presence: true
end

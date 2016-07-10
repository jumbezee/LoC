class Company < ActiveRecord::Base
  has_many :profiles
  has_many :products

end

class Property < ApplicationRecord
acts_as_mappable


geocoded_by :address
after_validation :geocode, :if => :address_changed?

end

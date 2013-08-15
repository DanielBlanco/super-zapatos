# This class manage Super-Zapatos' Stores.
#
# Attributes:
# => name:string
# => address:text
class Store < ActiveRecord::Base
  
  # Validations
  validates :name, :presence => true, :length => {:maximum => 100}
  validates :address, :length => {:maximum => 500}
  
  # Pagination.
  paginates_per 30
  max_paginates_per 100
  
end

# This class manage Super-Zapatos' Stores.
#
# Attributes:
# => name:string
# => description:text
class Article < ActiveRecord::Base
  
  belongs_to :store
  monetize :price_cents
  
  # Validations
  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}, :length => {:maximum => 100}
  validates :description, :length => {:maximum => 500}
  validates :total_in_shelf, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :total_in_vault, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }

  # Pagination.
  paginates_per 30
  max_paginates_per 100

  def humanized_price
    price.format(:no_cents_if_whole => true, :symbol => false)
  end
end

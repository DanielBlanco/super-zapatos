require 'spec_helper'

describe Article do

  it { should belong_to(:store) }  
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_most(100) }
  it { FactoryGirl.create(:article); should validate_uniqueness_of(:name).case_insensitive }
  
  it { should ensure_length_of(:description).is_at_most(500) }
  it { should validate_numericality_of(:total_in_shelf).only_integer }
  it { should validate_numericality_of(:total_in_shelf).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:total_in_vault).only_integer }
  it { should validate_numericality_of(:total_in_vault).is_greater_than_or_equal_to(0) }

end

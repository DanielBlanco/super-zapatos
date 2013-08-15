require 'spec_helper'

describe Store do
  
  it { should have_many(:articles) }  
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_most(100) }
  it { FactoryGirl.create(:store); should validate_uniqueness_of(:name).case_insensitive }
  
end

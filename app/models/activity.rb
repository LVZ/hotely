class Activity < ActiveRecord::Base
has_and_belongs_to_many :users

  attr_accessible :cost 
  attr_accessible :details
  attr_accessible :name
  attr_accessible :start_at
end

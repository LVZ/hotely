class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_and_belongs_to_many :activities
  attr_accessible :email
  attr_accessible :end_at
  attr_accessible :name
  attr_accessible :provider
  attr_accessible :start_at
  attr_accessible :uid
end

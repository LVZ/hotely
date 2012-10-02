class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_and_belongs_to_many :activities
  attr_accessible :email

before_save { |user| user.email = email.downcase }

  attr_accessible :end_at
  attr_accessible :name
  attr_accessible :provider
  attr_accessible :start_at
  attr_accessible :uid

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  			uniqueness: { case_sensitive: false }

end

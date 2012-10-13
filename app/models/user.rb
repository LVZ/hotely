class User < ActiveRecord::Base
  has_many :authentications
  authenticates_with_sorcery!
  has_and_belongs_to_many :activities
  has_and_belongs_to_many :trips

before_save { |user| user.email = email.downcase }

  attr_accessible :email
  attr_accessible :end_at
  attr_accessible :name
  attr_accessible :provider
  attr_accessible :start_at
  attr_accessible :uid
  attr_accessible :password
  attr_accessible :password_confirmation

  attr_accessor :password_confirmation
  attr_accessor :password


 validates :name, presence: true
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
			uniqueness: { case_sensitive: false }

def apply_ominauth(omniauth)
  self.email = omniauth['user_info']['email'] if email.blank?
  authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
end

def self.find_or_create_from_auth_hash(auth_hash)
  Rails.logger.debug auth_auth
end
end

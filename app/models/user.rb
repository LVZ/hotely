class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_and_belongs_to_many :activities
  
before_save { |user| user.email = email.downcase }
before_save :create_remember_token

  attr_accessible :email

  attr_accessible :end_at
  attr_accessible :name
  attr_accessible :provider
  attr_accessible :start_at
  attr_accessible :uid
  
  attr_accessor :password_confirmation
  attr_accessor :password 


 validates :name, presence: true
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
			uniqueness: { case_sensitive: false }

private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
    
  end
end

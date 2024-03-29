class Profile < ActiveRecord::Base
  belongs_to :user

  validates :first_name, :last_name, presence: true, length: { maximum: 50 }

# before_save { self.email = email.downcase }
# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
# validates :email, presence: true, length: { maximum: 255 },
#           format: { with: VALID_EMAIL_REGEX },
#           uniqueness: { case_sensitive: false }

  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
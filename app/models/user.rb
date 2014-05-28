# = MODELO USUARIOS
class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy  #----11.4---------
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",  #-----------11.16----------------
                                   class_name:  "Relationship", 
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower  #------11.16--------	

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

 #---10.35

  def feed
	# This is preliminary. See "Following users" for the full implementation.
	Micropost.from_users_followed_by(self)   #----------------------11.42
  end
#-------------11.12--------  
  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
#-----------11.12-----------
#-------11.14----------------
  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end	
#-------11.14--------------

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end

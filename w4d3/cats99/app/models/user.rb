class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true
  validates :password_digest, presence: true

  after_initialize :ensure_session_token


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(32)
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(32)
  end

  def self.find_by_credentials(user_name, password)
    current_user = User.find_by_user_name(user_name)
    if current_user
      return current_user if current_user.is_password?(password)
    end
  end


end

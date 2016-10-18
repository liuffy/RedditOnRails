class User < ActiveRecord::Base
  validates :username, :session_token, :password_digest, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true}
  attr_reader :password

  has_many(
    :subs,
    class_name: 'Sub',
    foreign_key: :moderator_id,
    inverse_of: :moderator
  )

  has_many :posts, inverse_of: :author


  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    user.try(:is_password?, password) ? username : nil
  end

  def reset_session_token! # generates new session token
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password # store password in instance variable
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    Bcrypt::Password.new(self.password_digest).is_password?(password)
  end


  private

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

end

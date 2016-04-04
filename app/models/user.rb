class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}

  attr_reader :password

  def password=(pw)
    @password = pw
    self.password_digest= BCrypt::Password.create(pw)
  end

  



end

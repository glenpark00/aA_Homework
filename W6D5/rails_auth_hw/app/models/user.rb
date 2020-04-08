class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :username, uniqueness: true
  validate :password_length

  def password_length
    if :password_digest.length < 8
      errors.add(:password_digest, "password is too short")
    end
  end
end

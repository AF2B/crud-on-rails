class User < ApplicationRecord
  include BCrypt

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  validates_email_realness_of :email

  def self.phone_number_valid?(phone) {
    regex = "/(\(?\d{2}\)?\s)?(\d{4,5}\-\d{4})/"
    result = phone.match(regex)
    result ? true : false
  }

  def create_user(email, password)
    user = User.new(email: email, password: password)
    user.password = BCrypt::Password.create(password)
    user.save!
    user
  end

  def check_password(password)
    BCrypt::Password.new(self.password) == password
  end

  def check_user(email, password)
    user = find_by_email(email)
    if user && user.check_password(password)
      user
    else
      nil
    end
  end

  def find_by_email(email)
    User.find_by(email: email)
  end
end

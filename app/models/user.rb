class User < ApplicationRecord
  before_save{self.email = email.downcase}

  validates :name, presence: true, length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
          format: {with: VALID_EMAIL_REGEX},
          uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

  validates :birthday, presence: true
  validate :validate_birthday_range
  private
  def validate_birthday_range
    return if birthday.blank?

    if birthday < 100.years.ago.to_date
      errors.add(:birthday, "must be within the last 100 years")
    end
    return unless birthday > Time.zone.today

    errors.add(:birthday, "cannot be in the future")
  end
end

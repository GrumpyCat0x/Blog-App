class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, length: { maximum: 50 }
  validates :last_name, length: { maximum: 50 }
  validates :bio, length: { maximum: 1000 }
  validate :date_of_birth_not_in_future

  def date_of_birth_not_in_future
    if date_of_birth.present? && date_of_birth > Date.today
      errors.add(:date_of_birth, "can't be in the future")
    end
  end
end
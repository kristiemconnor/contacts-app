class Contact < ApplicationRecord

  belongs_to :user
  belongs_to :group

  validates :first_name, presence: true

  validates :last_name, presence: true

  def friendly_updated_at
    updated_at.strftime("%b %d, %Y")
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def japan_phone_number
    "+81 #{phone}"
  end

end
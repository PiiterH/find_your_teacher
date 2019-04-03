class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :price, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  geocoded_by :postal_code_city
  after_validation :geocode, if: :will_save_change_to_postal_code?

  def nice_date
    date.strftime("%b %d, %a  %I:%M %p") if date
  end

  def postal_code_city
    "#{postal_code} #{city}"
  end
end

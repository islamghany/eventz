class Event < ApplicationRecord
  has_many :registrations, dependent: :destroy

  validates :name, :location, :description, :price, presence: true
  validates :description, length: { minimum: 25, maximum: 500 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :image_file_name, allow_blank: true, format: {
    with: /\w+\.(gif|jpg|png|jpeg)\z/i,
    message: "must reference a GIF, JPG, jpeg, or PNG image"
  }
  def free?
    price.blank? || price.zero?
  end

  def self.upcoming
    where("starts_at > ?", Time.now).order("starts_at")
  end

  def self.past
    where("starts_at < ?", Time.now).order("starts_at")
  end

  def self.by_price
    order("price desc")
  end

  def self.by_name
    order("name")
  end

  def self.search(term)
    where("name ILIKE ? OR location ILIKE ?", "%#{term}%", "%#{term}%").order("starts_at")
  end

  def sold_out?
    registrations.count >= capacity
  end
end

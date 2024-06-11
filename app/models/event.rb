class Event < ApplicationRecord
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
end

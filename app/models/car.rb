class Car < ApplicationRecord
  # validates_presence_of :make
  # validates_uniqueness of :make
  validates :make, uniqueness: true, presence: true

  def self.by_model
    order(:model)
  end

  def self.by_price(direction = :asc)
    order(price: direction)
  end

  def paint(color)
    self.update(color: color)
  end

  def honk
    'BEEP BEEP'
  end

  def info
    { make: self.make, model: self.model, color: self.color, price: self.price} 
  end
end

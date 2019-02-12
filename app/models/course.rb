class Course < ApplicationRecord
  has_many :lectures

  validates :name, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 500}
  validates :price, presence: true, numericality: {only_integer: true}
  validates :instructor, presence: true, length: {maximum: 50}

end
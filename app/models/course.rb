class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_many :lectures

  has_many :subcriptions
  has_many :users, through: :subcriptions

  has_many :reviews

  validates :name, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 500}
  validates :price, presence: true, numericality: {only_integer: true}
  validates :instructor, presence: true, length: {maximum: 50}
  validates :organization, presence: true, length: {maximum: 50}

  has_attached_file :image, styles: { medium: "480x200>", thumb: "170x75>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_attached_file :avatar, styles: { medium: "100x100>", thumb: "75x75>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def shortname
    name.length > 25? name[0..25] + "..." : name
  end

  def average_rating
    reviews.blank? ? 0 : reviews.average(:star).round(2)
  end


  def price_in_cents
    price*100
  end
end

class Course < ApplicationRecord
  has_many :lectures

  validates :name, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 500}
  validates :price, presence: true, numericality: {only_integer: true}
  validates :instructor, presence: true, length: {maximum: 50}
  validates :organization, presence: true, length: {maximum: 50}

  has_attached_file :image, styles: { medium: "680x200>", thumb: "170x75>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_attached_file :avatar, styles: { medium: "100x100>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end

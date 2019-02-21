class Lecture < ApplicationRecord


  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :course

  validates :title, presence: true, length: {maximum: 50}
  validates :video, presence: true
  validates :tag, presence: true
  validates :course, presence: true

  def next
    course.lectures.where("tag > ? AND header = ?", tag, false).order(:tag).first
  end

  def prev
    course.lectures.where("tag < ? AND header = ?", tag, false).order(:tag).last
  end

end

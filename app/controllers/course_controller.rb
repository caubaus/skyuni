class CourseController < ApplicationController

  before_action :authenticate_user!, only: [:list]

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @lectures = @course.lectures.order(:tag)

    @joined = false

    if !current_user.nil? && !current_user.courses.nil? #logged in & courses enrolled
      @joined = current_user.courses.include?(@course)
    end

    @users = @course.users.order('created_at DESC').first(10)

    @review = Review.new
    @reviews = @course.reviews
    @hasReview = @reviews.find_by(user_id: current_user.id) if current_user #current_user  has to be not nill
  end

  def list
    if !current_user.nil?
      @courses = current_user.courses
    end
  end

end

class ReviewsController < ApplicationController

  def create
    @review = Review.create(review_params)
    course = @review.course

    redirect_to course
  end

  def destroy
    @review = Review.find(params[:id])
    course = @review.course

    if @review.present?
      @review.destroy
    end

    redirect_to course
  end

  private
    def review_params
      params.require(:review).permit(:star, :comment, :course_id, :user_id)
    end
end

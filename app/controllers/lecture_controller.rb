class LectureController < ApplicationController
  def show
    course = Course.find(params[:course_id])
    @lectures = course.lectures
    @lecture = @lectures.find(params[:id])
  end
end

class LectureController < ApplicationController
  def show
    course = Course.find(params[:course_id])
    @lectures = course.lectures.order(:tag)
    @lecture = @lectures.find(params[:id])

    @next_lecture = @lecture.next
    @prev_lecture = @lecture.prev
  end
end

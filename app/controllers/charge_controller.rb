class ChargeController < ApplicationController

  before_action :authenticate_user! #user need to be logged in

  def free
    course = Course.find(params[:course_id])
    current_user.subcriptions.create(course: course)

    redirect_to course
  end
end

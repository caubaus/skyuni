class Subcription < ApplicationRecord
  belongs_to :course
  belongs_to :user

  after_create :send_receipt_email

  private
    def send_receipt_email
      @user = User.find_by_email(self.user.email)
      @course = Course.find(self.course_id)

      MyMailer.new_receipt(@user, @course).deliver
    end
end

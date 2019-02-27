class MyMailer < ActionMailer::Base
  def mandrill_client
    @mandrill_client ||= Mandrill::API.new ENV['MAILER_API_KEY']
  end

  def new_user(user)
    template_name = "new-user"
    template_content = []
    message = {
      to: [{email: "#{user.email}"}],
      subject: "Welcome to SkyUni",
      merge_vars: [
        {
          rcpt: user.email,
          vars: [{name: "USER_NAME", content: user.name}]
        }
      ]
    }
    mandrill_client.messages.send_template template_name, template_content, message
  end

  def new_receipt(user, course)
    template_name = "new-new_receipt"
    template_content = []
    message = {
      to: [{email: "#{user.email}"}],
      subject: "Welcome to SkyUni - Your Receipt",
      merge_vars: [
        {
          rcpt: user.email,
          vars: [
            {name: "STUDENT_NAME", content: user.name},
            {name: "COURSE_NAME", content: course.name},
            {name: "COURSE_PRICE", content: course.price}
          ]
        }
      ]
    }
    mandrill_client.messages.send_template template_name, template_content, message
  end

end

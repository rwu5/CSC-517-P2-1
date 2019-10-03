class StudentMailer < ApplicationMailer
  default from: 'postmaster@sandbox84d833d7a0294e9f875abf19412cc7fe.mailgun.org'

  def borrow_success(email)
    mail to: email,subject: 'Book borrowed successful!'
  end
end

class StudentMailer < ApplicationMailer
  default from: 'csc517team666@gmail.com'

  def borrow_success(email)
    mail to: email,subject: 'Book borrowed successful!'
  end
end

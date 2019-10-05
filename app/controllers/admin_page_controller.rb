class AdminPageController < ApplicationController
  def show_all_students
    @students = Student.all
  end
end

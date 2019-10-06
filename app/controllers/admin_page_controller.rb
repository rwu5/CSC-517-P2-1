class AdminPageController < ApplicationController
  def show_all_students
    @students = Student.all
  end

  def approve_librarian
    @librarian = Librarian.find(params[:id])
    @librarian.is_approved = 1
    # TODO: send an email to this librarian
    @librarian.save
    respond_to do |format|
      format.html { redirect_to librarians_path, notice: 'Approved!' }
      format.json { head :no_content }
    end
  end

  def deny_librarian
    @librarian = Librarian.find(params[:id])
    @librarian.destroy
    # TODO: send an email to this librarian
    respond_to do |format|
      format.html { redirect_to librarians_path, notice: 'Denied!' }
      format.json { head :no_content }
    end
  end
end

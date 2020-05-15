class LoginsController < ApplicationController
  def new; end

  def create
    student = Student.find_by(email: params[:logins][:email])
    if student && student.authenticate(params[:logins][:password])
      session[:student_id] = student.id
      flash[:success] = 'You have succcessfully logged in'
      redirect_to student
    else
      flash[:notice] = 'Something wrong with your login information login'
      render 'new'
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = 'you have successfully logout'
    redirect_to root_path
  end
end

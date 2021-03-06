class StudentsController < ApplicationController
  skip_before_action :require_user, only: %i[new create]
  before_action :set_student, only: %i[show edit update]
  before_action :require_same_student, only: %i[edit update]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = 'Success you have signed up '
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @student.update(student_params)
      flash[:success] = 'You have successful edited data'
      redirect_to student_path(@student)
    else
      render 'edit'
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def require_same_student
    if current_user != @student
      flash[:success] = 'You can only edit your own profil'
      redirect_to student_path(current_user)
    end
  end
end

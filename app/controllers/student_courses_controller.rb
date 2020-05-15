class StudentCoursesController < ApplicationController
  def create
    course = Course.find(params[:course_id])
    if !current_user.courses.include?(course)
      StudentCourse.create(course: course, student: current_user)
      flash[:success]="You have successflly enrollement"
      redirect_to current_user
    else
      flash[:notice] = 'wrong enrollment'
      redirect_to current_user
    end
  end
end

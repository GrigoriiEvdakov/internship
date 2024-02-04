class StudentsController < ApplicationController
  before_action :authorize!, except: :create

  def index
    students = Student.where(school_id: params[:school_id],
                             school_class_id: params[:class_id])
    render json: students
  end

  def create
    School::Class.find(params[:student][:school_class_id]).increment!(:students_count) if
      Student.create!(student_params)
    p School::Class.find(params[:student][:school_class_id])
    response.headers['Authorization'] = "Bearer #{token}"
    render json: { status: 'ok' }
  end

  def destroy
    class_id = student.school_class_id

    School::Class.find(class_id).decrement!(:students_count) if student.destroy

    render json: { status: 'ok' }
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name,
                                    :surname, :school_class_id, :school_id)
  end

  def student
    @student ||= Student.find(params[:id])
  end
end

class ClassesController < ApplicationController
  before_action :authorize!

  def index
    classes = School::Class.where(school_id: params[:school_id])

    render json: classes
  end
end

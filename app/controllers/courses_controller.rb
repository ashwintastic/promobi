class CoursesController < ApiController
  def create
     begin
      resp = Course.create!(course_params)
      render json: resp
     rescue => err
      render json: { message: err.message }
     end
  end

  def index
    resp = Course.all
    render json: resp
  end

  private
  def course_params
    params.permit(:name, :desc)
  end
end

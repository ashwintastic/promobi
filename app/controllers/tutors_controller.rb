class TutorsController < ApiController
  def create
    resp = Tutor.create_tutor(tutor_params)
    render json: resp
  end

  private
  def tutor_params
    # Ignoring password encryption while transition
    params.permit(:user_name, :course_name)
  end
end

class UsersController < ApiController
  def create
    begin
      resp = User.create!(user_params)
      render json: resp
    rescue => err
      # ignoring actual error code
      render json: { message: err.message, status: 500 }
    end
  end

  private
  def user_params
    # Ignoring password encryption while transition
    params.permit(:email, :password, :user_name, :f_name, :l_name, :phone)
  end
end

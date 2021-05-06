class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if (@user.save)
      new_auth_header = @user.create_new_auth_token
      # update response with the header that will be required by the next request
      response.headers.merge!(new_auth_header)

      render json: @user, status: :created
    else
      render json: @user.errors.full_messages.to_sentence, status: 400
    end
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

end

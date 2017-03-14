class Api::V1::Accounts::SessionsController < DeviseController
  before_action :user_params

  def create
    if @user.present?
      if @user.valid_password? params[:user][:password]
        if @user.remember_me!
          render json: {data: @user.as_json, message: "Logged in successfully!!", status: 200, success: true}
        else
          @user.forget_me!
          render json: {message: "Try again!", status: 422, success: true}
        end
      else
        render json:{message: "Pesst!! Invalid username or password", status: 422, success: false}
      end
    else
      render json:{message: "Pesst!! Invalid username or password", status: 422, success: false}
    end

  end

  # DELETE /resource/sign_out
  def destroy
    if @user.remember_me!
      @user.forget_me!
      render json:{message: "Logged out successfully!!", status: 422, success: false}
    else
      render json:{message: "You have not logged in!!", status: 422, success: false}
    end
  end

  protected

  def translation_scope
    'devise.sessions'
  end

  private

  def user_params
    @user = User.find_by_email(params[:user][:email])
  end

end
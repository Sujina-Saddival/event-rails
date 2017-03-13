class Api::V1::Accounts::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)

    if (params[:user][:password] == params[:user][:password_confirmation])
      if resource.save
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        render json: {data: resource.as_json, message: "Registered Successfully", success: true, status: 200}
      else
        render json: {message: "Invalid Input!!", success: false, status: 422}
      end
      else
        render json: {message: "Email already in use!!", success: false, status: 422}
      end
    else
      render json: {message: "Pess!! Password did not match", success: false, status: 422}
    end
  end

  private
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email,:password)
  end

end
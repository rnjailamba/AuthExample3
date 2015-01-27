class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
   respond_to :json
   skip_before_filter :verify_signed_out_user
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
 

  # DELETE /resource/sign_out
  def destroy
    if user_signed_in?
      @user = current_user
      @user.authentication_token = nil
      @user.save

      respond_to do |format|
        format.json {
          render json: {
            message: 'Logged out successfully.'
          }
        }
      end
    else
      respond_to do |format|
        format.json {
          render json: {
            message: 'Failed to log out. User must be logged in.'
          }
        }
      end
    end
  end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
  
end

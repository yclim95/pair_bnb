class SessionClearancesController < Clearance::SessionsController
  layout "sign_up"

  def new
    @user = User.new 
  end

	def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
      	flash[:success] = "You are successfully Log In"
        redirect_back_or url_after_create

      else
      	#flash.now[:error] = status.failure_message

        if User.find_by_email(params[:session][:email]).nil?
          flash.now[:danger] = "#{params[:session][:email]} is not valid."
        else
          flash.now[:danger] = "Invalid password."
        end

        render "new", status: :unauthorized
      end
    end
  end

end
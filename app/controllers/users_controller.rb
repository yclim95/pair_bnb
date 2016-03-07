class UsersController < ApplicationController
  def index
    @users = User.new 
    render :layout => "main"
  end

  def new
     @users = User.new 
     render :layout => "sign_up"
  end

  def create
    @user = user_from_params
    byebug
    if @user.save
      sign_in @user
      flash[:success] = "Your accout have been successfully created!"
      redirect_to users_path
    else
      render "new"
    end
  end

  def show
  	@user = current_user
    render :layout => false
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_permit_params)
      flash[:success] = "Your account have been updated!"
  	  redirect_to user_path(:id => current_user.id)
  	else
      flash.now[:danger] = "Invalid input, Please Try again"
  	  render "edit"
  	end
  end

  private 
  def user_permit_params 
    params.require(:user).permit(:name, :email, :password)
  end

  def avoid_sign_in
    warn "[DEPRECATION] Clearance's `avoid_sign_in` before_filter is " +
      "deprecated. Use `redirect_signed_in_users` instead. " +
      "Be sure to update any instances of `skip_before_filter :avoid_sign_in`" +
      " or `skip_before_action :avoid_sign_in` as well"
    redirect_signed_in_users
  end

  def redirect_signed_in_users
    if signed_in?
      redirect_to Clearance.configuration.redirect_url
    end
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    name = user_params.delete(:name)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.name = name
    end
  end

  def user_params
   params[:user] || Hash.new
  end
end
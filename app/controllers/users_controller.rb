class UsersController < ApplicationController
  before_filter :require_user, :except => %w[create new show]

  def new
    redirect_to user_path(session.user) if session.authenticated?
    @user = User.new
  end

  def create
    @user = User.signup params[:user]

    if @user.valid?
      session.user = @user
      redirect_to root_path
    else
      flash[:error] = "Errors: #{@user.errors.full_messages.to_sentence}"
      render :template => 'users/new'
    end
  end

  def destroy
    session.user.destroy

    redirect_to home_path
  end

  def edit
    @user = session.user
  end

  def current
    @user = session.user

    if @user.profile
      redirect_to dash_path()
    else
      render :action => 'show'
    end
  end

  def settings
    @user = session.user
  end

  def show
    @user = User.find(params[:id])
    if @user.profile
      redirect_to profile_path(@user.profile)
    end
  end

  def update
    @user = session.user

    @user.attributes = params[:user]

    if @user.save then
      flash[:success] = "Changes saved successfully."
    else
      flash[:error] = "Failed to save your changes: " +
        @user.errors.full_messages.to_sentence
    end

    redirect_to profile_path(@user.profile)
  end
end

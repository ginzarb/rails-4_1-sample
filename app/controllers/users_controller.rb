class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @active_users = User.active
    @inactive_users = User.inactive
  end

  def show
   if @user.inactive?
     token =  Rails.application.message_verifier('email_confirmation').generate([@user.id, Time.now])
     @regist_url = email_confirmation_users_url(token: token)
   end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.status = :inactive
    token =  Rails.application.message_verifier('email_confirmation').generate([@user.id, Time.now])
    @regist_url = email_confirmation_users_url(token: token)

    if @user.save
      render action: 'create'
    else
      render action: 'new'
    end
  end

  def destroy
    @user.deleted!
    redirect_to users_path
  end

  def email_confirmation
    id, time = Rails.application.message_verifier('email_confirmation').verify(params[:token])
    # もし必要であればtimeの値のチェック
    User.find(id).active!
  end


  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email)
    end
end

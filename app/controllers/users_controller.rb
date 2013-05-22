class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  def toggle_admin
    @user = User.find(params[:user_id])
    @user.admin = !@user.admin
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: t("flash.notice.successfully_changed_permission", username: @user.name) }
        format.json { head :ok }
      else
        format.html { redirect_to users_path, notice: t("flash.notice.failed_change_permission", username: @user.name) }
        format.json { head :error }
      end
    end
  end
end

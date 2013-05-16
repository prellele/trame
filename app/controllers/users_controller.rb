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
    if @user.admin?
      @user.admin = false
      if @user.save
        respond_to do |format|
          format.html { redirect_to users_path, notice: t("flash.notice.downgrade_user", username: @user.name) }
          format.json { head :ok }
        end
      else
        respond_to do |format|
          format.html { redirect_to users_path, notice: t("flash.notice.failed_downgrade_user", username: @user.name) }
          format.json { head :error }
        end
      end
    else
      @user.admin = true
      if @user.save
        respond_to do |format|
          format.html { redirect_to users_path, notice: t("flash.notice.upgrade_user", username: @user.name) }
          format.json { head :ok }
        end
      else
        respond_to do |format|
          format.html { redirect_to users_path, notice: t("flash.notice.failed_upgrade_user", username: @user.name) }
          format.json { head :error }
        end
      end
    end
  end
end

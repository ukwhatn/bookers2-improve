class GroupUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_not_owner

  def create
    group_user = current_user.group_users.new(group_id: params[:group_id])
    group_user.save
    redirect_to request.referer
  end

  def destroy
    group_user = current_user.group_users.find_by(group_id: params[:group_id])
    group_user.destroy
    redirect_to request.referer
  end

  private

  def check_not_owner
    if Group.find(params[:group_id]).is_owned_by?(current_user)
      redirect_to groups_path
    end
  end

end

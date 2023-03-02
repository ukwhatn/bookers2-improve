class DirectMessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_following_each_other

  def index
    @target = User.find(params[:user_id])
    @messages = DirectMessage.where(
      from_id: current_user.id, to_id: @target.id
    ).or(DirectMessage.where(
      from_id: @target.id, to_id: current_user.id
    ))

    @new_message = DirectMessage.new
  end

  def create
    message = DirectMessage.new(direct_message_params)
    message.from_id = current_user.id
    message.to_id = User.find(params[:user_id]).id

    message.save

    redirect_to user_direct_messages_path(params[:user_id])
  end

  private

  def direct_message_params
    params.require(:direct_message).permit(:message)
  end

  def check_following_each_other
    target = User.find(params[:user_id])

    unless current_user.following?(target) && target.following?(current_user)
      redirect_to user_path(target)
    end
  end
end

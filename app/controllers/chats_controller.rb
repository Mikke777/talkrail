class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:new, :create]

  def index
    @chats = Chat.involving(current_user)
  end

  def new
    @chat = Chat.new
  end

  def show
    @chat = Chat.find(params[:id])
    @messages = @chat.messages
    @message = @chat.messages.build
  end

  def create
    @chat = Chat.find_or_create_by(user: current_user, profile: @profile)
    redirect_to chat_path(@chat), notice: 'Chat was successfully created.'
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end
end

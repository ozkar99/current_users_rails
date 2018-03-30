class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    @user = User.find(params[:id])
    stream_from @user
  end
end
class OnlineUsersController < ApplicationController

  def index
    @online_users = User.currently_online
  end

end
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def self.currently_online
    server = ActionCable.server
    users = ActionCable.server.connections.map do |conn|
      decoded = Base64.decode64 conn.connection_identifier
      user_id = decoded.split('/').last
      User.find(user_id)
    end
    users.uniq
  end
end

class UserManager
  class User
    def sign_in

    end

    def sign_off

    end
  end

  attr_accessor :users, :users_by_account_name, :users_by_id, :online_users


  def initialize users
    @users = users || []

    # fill users_by_account_name, users_by_id with data
    online_users
  end

  def user_online? user

  end

end

class Message
  attr_accessor :id, :autor, :content, :data

  def initialize content, data
    @id = # generate uniq id
    @content = content
    @data = data || Time.now
  end
end

def Conversation #base class
  attr_accessor :participants

end
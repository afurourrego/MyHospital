module Levels
  module Administrator
    def administrator_rules
      can %i[index read update],                                                User, id: @user.id
      cannot %i[create destroy],                                                User

      can %i[index read create update],                                         Profile
      cannot %i[destroy],                                                       Profile
    end
  end
end

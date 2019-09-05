module Levels
  module Administrator
    def administrator_rules
      can %i[index read update],                                                User, id: @user.id
      cannot %i[create destroy],                                                User
    end
  end
end

module Levels
  module Doctor
    def doctor_rules
      can %i[index read update],                                                User, id: @user.id
      cannot %i[create destroy],                                                User    end
  end
end

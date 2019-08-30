module Levels
  module Doctor
    def doctor_rules
      can :manage, :all
    end
  end
end

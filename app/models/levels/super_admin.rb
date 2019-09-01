module Levels
  module SuperAdmin
    def super_admin_rules
      can :manage, :all
    end
  end
end

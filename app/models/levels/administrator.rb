module Levels
  module Administrator
    def administrator_rules
      can :manage, :all
    end
  end
end

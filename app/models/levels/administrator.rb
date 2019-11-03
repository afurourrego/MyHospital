module Levels
  module Administrator
    def administrator_rules
      can %i[index read update],                                                User, id: @user.id
      cannot %i[create destroy],                                                User

      can %i[index read create update],                                         Profile
      cannot %i[destroy],                                                       Profile

      cannot :manage,                                                           Setting
      cannot :manage,                                                           Arl
      cannot :manage,                                                           Ep

      can %i[index read create update check_assistance],                        Appointment
      cannot %i[destroy diagnostic diagnostic_send],                            Appointment

      can %i[read],                                                             Order
      cannot %i[create update destroy],                                         Order

      can :manage,                                                              History

    end
  end
end

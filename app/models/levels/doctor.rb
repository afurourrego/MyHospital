module Levels
  module Doctor
    def doctor_rules
      can %i[index read update],                                                User, id: @user.id
      cannot %i[create destroy],                                                User

      can %i[index read],                                                       Profile
      cannot %i[create update destroy],                                         Profile

      cannot :manage,                                                           Setting
      cannot :manage,                                                           Arl
      cannot :manage,                                                           Ep

      can %i[index read diagnostic diagnostic_send],                            Appointment, doctor_id: @user.id, assistance: true
      cannot %i[destroy create update check_assistance],                        Appointment

    end
  end
end

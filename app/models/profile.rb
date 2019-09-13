class Profile < ApplicationRecord

  belongs_to :eps, class_name: 'Ep', optional: true 
  belongs_to :arl


  enum rh: {'A+': 1, 'B+': 2, 'AB+': 3, 'O+': 4, 'A-': 5, 'B-': 6, 'AB-': 7, 'O-': 8 }


  def self.eps_list
    Ep.all.pluck(:name, :id)
  end

  def self.arl_list
    Arl.all.pluck(:name, :id)
  end
end

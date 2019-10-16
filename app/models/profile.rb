class Profile < ApplicationRecord

  has_many :appointments
  has_many :orders

  belongs_to :eps, class_name: 'Ep', optional: true
  belongs_to :arl, optional: true

  validates :identification_card, presence: true
  validates :full_name, presence: true
  validates :phone, presence: true


  enum rh: {'A+': 1, 'B+': 2, 'AB+': 3, 'O+': 4, 'A-': 5, 'B-': 6, 'AB-': 7, 'O-': 8 }

  date_time_attribute :birthday

  def self.search(profiles, params)

    profiles = profiles.where(identification_card: params['identification_card']) unless params['identification_card'].blank?
    profiles = profiles.where(full_name: params['full_name']) unless params['full_name'].blank?
    profiles = profiles.where(email: params['email']) unless params['email'].blank?

    profiles
  end

  def self.eps_list
    Ep.all.pluck(:name, :id)
  end

  def self.arl_list
    Arl.all.pluck(:name, :id)
  end
end

class Order < ApplicationRecord

  belongs_to :doctor, class_name: 'User', optional: true
  belongs_to :patient, class_name: 'Profile', optional: true
  belongs_to :appointment, class_name: 'Appointment', optional: true

  validates :doctor, presence: true
  validates :patient, presence: true
  validates :appointment, presence: true
  validates :type_order, presence: true
  validates :description, presence: true

  enum type_order: { 'medication': 1, 'disability': 2, 'therapy': 3, 'exam': 4 }

end

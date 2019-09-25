class Order < ApplicationRecord

  belongs_to :doctor, class_name: 'User', optional: true
  belongs_to :patient, class_name: 'Profile', optional: true
  belongs_to :appointment, class_name: 'Appinment', optional: true

  validates :doctor, presence: true
  validates :patient, presence: true
  validates :appointment, presence: true

end

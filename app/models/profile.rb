class Profile < ApplicationRecord

  enum rh: {'A+': 1, 'B+': 2, 'AB+': 3, 'O+': 4, 'A-': 5, 'B-': 6, 'AB-': 7, 'O-': 8 }
end

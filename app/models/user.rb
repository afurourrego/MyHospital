class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_and_belongs_to_many :appointments
  has_many :orders

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validate :validate_permited_roles, on: :update

  # validates_length_of :phone, minimum: 10, on: :changed?
  # validates :phone, presence: true, on: phone_changed?

  before_validation :clean_number_phone


  enum role: { 'super_admin': 1, 'administrator': 2, 'doctor': 3 }

  def self.search(usr, params)
    unless params['email'].blank?
      search = "%#{params['email']}%"
      usr = usr.where('lower(email) LIKE ?', search.downcase)
    end
    usr
  end

  def permited_role
    if super_admin?
      User.roles
    else
      User.roles.reject { |_r, n| n != User.roles[role] }
    end
  end

  def validate_permited_roles
    return true if User.current.blank?
    return true unless role_changed?
    return true if User&.current&.permited_role&.include?(role)

    errors.add(:role, 'Unpermitted role')
    false
  end

  def clean_number_phone
    self.phone = phone&.gsub(/(?!^\+)\D*/, '')
  end

  def self.doctor_list
    doctors = User.all.where(role: 'doctor')
    doctors = doctors.pluck(:name, :id)
  end

  private

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

end

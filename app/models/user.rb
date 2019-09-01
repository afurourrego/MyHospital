class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  # validate :validate_permited_roles



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
    return true unless role_changed?
    return true if User&.current&.permited_role.include?(role)

    errors.add(:role, 'role no permitido')
    false
  end

  private

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

end

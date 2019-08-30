class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :role, presence: true


  enum role: { 'super_admin': 1, 'administrator': 2, 'doctor': 3 }

  def self.search(usr, params)
    unless params['email'].blank?
      search = "%#{params['email']}%"
      usr = usr.where('lower(email) LIKE ?', search.downcase)
    end
    usr
  end

  private

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

end

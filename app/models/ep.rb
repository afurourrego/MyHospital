class Ep < ApplicationRecord

  has_and_belongs_to_many :profiles

  validates :name, presence: true, uniqueness: true

  def self.search(eps, params)
    unless params['name_eps'].blank?
      search = "%#{params['name_eps']}%"
      eps = eps.where('lower(name) LIKE ?', search.downcase)
    end
    eps
  end

end

class Ep < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  def self.search(eps, params)
    unless params['name_eps'].blank?
      search = "%#{params['name_eps']}%"
      eps = eps.where('lower(name) LIKE ?', search.downcase)
    end
    eps
  end

end

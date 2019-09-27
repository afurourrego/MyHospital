class Arl < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  def self.search(arl, params)
    unless params['name_arl'].blank?
      search = "%#{params['name_arl']}%"
      arl = arl.where('lower(name) LIKE ?', search.downcase)
    end
    arl
  end

end

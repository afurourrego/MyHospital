class Arl < ApplicationRecord

  has_and_belongs_to_many :profiles

  def self.search(arl, params)
    unless params['name_arl'].blank?
      search = "%#{params['name_arl']}%"
      arl = arl.where('lower(name) LIKE ?', search.downcase)
    end
    arl
  end

end

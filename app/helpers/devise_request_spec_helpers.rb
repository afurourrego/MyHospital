module DeviseRequestSpecHelpers

  # include Warden::Test::Helpers

  # def sign_in(resource_or_scope, resource = nil)
  #   binding.pry
  #   resource ||= resource_or_scope
  #   scope = Devise::Mapping.find_scope!(resource_or_scope)
  #   binding.pry
  #   login_as(resource, scope: scope)
  # end

  def sign_out(resource_or_scope)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    logout(scope)
  end

end

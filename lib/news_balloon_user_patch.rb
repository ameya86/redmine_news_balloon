require_dependency 'principal'
require_dependency 'user'

class User < Principal
  attr_accessor :last_before_access_on
end

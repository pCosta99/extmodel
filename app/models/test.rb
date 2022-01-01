class Test < ActiveRecord::Base
  enum status: %i[started done], _prefix: true, default: :started
end

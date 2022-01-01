class Test < ApplicationRecord
  enum status: %i[started done], _prefix: true, _default: :started
end

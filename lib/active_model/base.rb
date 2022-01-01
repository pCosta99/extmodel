require 'active_model/enum'

module ActiveModel
  class Base
    extend Enum

    include Model
    include AttributeMethods
    include Serializers::JSON
  end

  ActiveSupport.run_load_hooks(:active_model, Base)
end

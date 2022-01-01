require 'active_model/enum'

module ActiveModel
  class Base
    include ActiveModel::Model
    include ActiveModel::AttributeMethods
    include ActiveModel::Serializers
    include ActiveModel::Serializers::JSON
    extend ActiveModel::Enum
  end

  ActiveSupport.run_load_hooks(:active_model, Base)
end

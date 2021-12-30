# frozen_string_literal: true

# An external user that can be used as a regular ActiveRecord object
class User
  include ActiveModel::API
  include ActiveModel::Serializers::JSON

  SOURCE = 'https://jsonplaceholder.typicode.com/users'

  attr_accessor :id, :name, :username

  def initialize(id)
    @source = SOURCE
    from_json(record(id).body)
  end

  def attributes=(hash)
    hash.each do |key, value|
      self.class.send(:attr_accessor, key)
      send("#{key}=", value)
    end
  end

  def perform_action
    # Hits an API
    :noop
  end

  def record(id)
    HTTParty.get("#{@source}/#{id}")
  end
end

# frozen_string_literal: true

require 'active_model/base'

# An external user that can be used as a regular ActiveRecord object
class User < ActiveModel::Base
  SOURCE = 'https://jsonplaceholder.typicode.com/users'
  STATUS = %i[smart dumb].freeze

  attr_accessor :id, :name, :username

  enum status: Hash[*STATUS.collect { |v| [v, v] }.flatten]

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

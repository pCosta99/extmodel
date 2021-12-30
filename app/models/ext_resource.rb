# frozen_string_literal: true

# An external resource that can be used as a regular ActiveRecord object
class ExtResource
  include ActiveModel::API
  include ActiveModel::Serializers::JSON

  SOURCE = 'https://mocki.io/v1/a6d7764e-df71-40f7-bbae-763549b2421e'

  attr_accessor :id, :status, :random

  def initialize(id = nil)
    @source = SOURCE
    from_json(record.body)
    self.id = id unless id.nil?
  end

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end

  def perform_action
    # Hits an API
    :noop
  end

  def record
    HTTParty.get(@source)
  end
end

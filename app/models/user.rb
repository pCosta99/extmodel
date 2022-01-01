# frozen_string_literal: true

require 'active_model/base'

# An external user that can be used as a regular ActiveRecord object
class User < ActiveModel::Base
  include ActiveModel::Attributes
  SOURCE = 'https://jsonplaceholder.typicode.com/users'
  STATUS = %i[smart dumb].freeze

  attribute :id, :integer
  attribute :name, :string
  attribute :username, :string
  attribute :email, :string

  enum status: Hash[*STATUS.collect { |v| [v, v] }.flatten]

  def perform_action
    # Hits an API
    :noop
  end

  def self.find(id)
    new(JSON.parse(record(id).body).slice(*User.attribute_names))
  end

  def self.record(id)
    HTTParty.get("#{SOURCE}/#{id}")
  end
end

class ExtResourcesController < ApplicationController
  before_action :load_resource

  def some_action
    @ext.perform_action
  end

  private

  def load_resource
    @ext = ExtResource.new
  end
end

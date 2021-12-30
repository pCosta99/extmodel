class HomeController < ApplicationController
  def index
    @ext = ExtResource.new
  end
end

class HomeController < ApplicationController
  def index
    @user = User.new(1)
  end
end

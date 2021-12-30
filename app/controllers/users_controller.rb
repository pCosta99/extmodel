class UsersController < ApplicationController
  before_action :load_resource

  def some_action
    @user.perform_action
  end

  private

  def load_resource
    @user = User.new(params[:id])
  end
end

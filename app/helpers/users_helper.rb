module UsersHelper
  def user_form_helper(action)
    form_with model: @user, url: { action: action, controller: :users, id: @user.id } do |form|
      yield form if block_given?
    end
  end
end

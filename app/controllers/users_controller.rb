class UsersController < ApplicationController
  
  def show
    @user = current_user
    if @user
      @item_list = @user.items
    end
  end
end
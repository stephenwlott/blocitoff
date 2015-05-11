class UsersController < ApplicationController
  
  def show
    @user = current_user
    if @user
      @items = @user.items
    end
  end
end
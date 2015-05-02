class ItemsController < ApplicationController
  def new
    @item = Item.new
    @user = current_user
  end
  
  def create
    @user = current_user
    @user_id = @user.id
    @item = Item.new(params.require(:item).permit(:name))
    @item.user = current_user
    if @item.save
      redirect_to '/', notice: "Item was saved successfully."
    else
      flash[:error] = "Error creating item. Please try again."
      render :new
    end
  end
end

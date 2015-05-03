class ItemsController < ApplicationController
  def new
    @item = Item.new
    @user = current_user
  end
  
  def create
    @item = current_user.items.new(params.require(:item).permit(:name))
    if @item.save
      redirect_to '/', notice: "Item was saved successfully."
    else
      flash[:error] = "Error creating item. Please try again."
      render :new
    end
  end
end

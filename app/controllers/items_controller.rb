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
  
  def destroy
    @item = current_user.items.find(params[:id])
 
    if @item.destroy
      flash[:notice] = "To-Do Item was deleted."
      #redirect_to user_path
    else
      flash[:error] = "To-Do Item couldn't be deleted. Try again."
      #redirect_to user_path
    end
    
    respond_to do |format|
      format.html
      format.js
    end
    
  end
  
  private

  def comment_params
    params.require(:item).permit(:name)
  end
end

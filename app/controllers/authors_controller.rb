class AuthorsController < ApplicationController
  def new

  end
  def create
    @author = Author.new(params[:author])
    if @author.save
      flash[:notice] = "The author was saved successfully."
      redirect_to :action => "index"
    else  
      render :action => "new"
    end
  end
  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(params[:author])
      flash[:notice] = "The author was updated successfully."
      redirect_to :action => "show"
    else
      render :action => "edit"
    end
  end
  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to :action => "index"
  end
end

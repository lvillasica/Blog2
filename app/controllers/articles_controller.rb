class ArticlesController < ApplicationController
  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = "The article was saved successfully."
      redirect_to :action => "index"
    else  
      render :action => "new"
    end
  end
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "The article was updated successfully."
      redirect_to :action => "show"
    else
      render :action => "edit"
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :action => "index"
  end
end

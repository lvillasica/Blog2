require 'spec_helper'

describe ArticlesController do
  describe "POST create" do
    let(:article) {mock_model(Article).as_null_object}
    before(:each) do
      Article.stub(:new).and_return(article)
    end
    it "creates a new article" do
      Article.should_receive(:new).with("title" => "An article", "body" => "haha").and_return(article)
      post :create, :article => { "title" => "An article", "body" => "haha"}
    end
    it "saves the article" do
      article.should_receive(:save)
      post :create
    end
    it "redirects to the Article index" do
      post :create
      response.should redirect_to(:action => "index")
    end
    context "when the article saves successfully" do
      it "sets a flash[:notice] message" do
        post :create
        flash[:notice].should eq("The article was saved successfully.")
      end
      it "redirects to the Article index" do
        post :create
        response.should redirect_to(:action => "index")
      end
    end
    context "when the article fails to save" do
      before(:each) do
        article.stub(:save).and_return(false)
      end
      it "assigns @article" do        
        post :create
        assigns[:article].should eq(article)
      end
      it "renders the new template" do
        post :create
        response.should render_template("new")
      end
    end
  end
  describe "PUT update" do
    let(:article) {mock_model(Article).as_null_object}
    before(:each) do
      Article.should_receive(:find).with(article.id).and_return(article)
    end
    it "updates an existing Article" do
      Article.stub(:find).with(article.id).and_return(article)
      article.should_receive(:update_attributes)
      put :update, :id => article.id, :article => {"title" => "Article", "body" => "hehe"}
    end
    it "redirects to the show Article page" do
      put :update, :id => article.id
      response.should redirect_to(:action => "show")
    end
    context "when the article updates successfully" do
      before(:each){put :update, :id => article.id}
      it "sets a flash[:notice] message" do
        flash[:notice].should eq("The article was updated successfully.")
      end
      it "redirects to the show Article page" do
        response.should redirect_to(:action => "show")
      end
    end
    context "when the article fails to update" do
      before(:each) do
        article.stub(:update_attributes).and_return(false)
        put :update, :id => article.id
      end
      it "assigns @article" do      
        assigns[:article].should eq(article)
      end
      it "renders the new template" do
        response.should render_template("edit")
      end
    end
  end
  describe "DELETE destoy" do
    let(:article) {mock_model(Article).as_null_object}
    before(:each) do
      Article.should_receive(:find).with(article.id).and_return(article)
    end
    it "deletes an existing Article" do
      Article.stub(:find).with(article.id).and_return(article)
      article.should_receive(:destroy)
      delete :destroy, :id => article.id
    end
    it "redirects to the Article index" do
      delete :destroy, :id => article.id
      response.should redirect_to(:action => "index")
    end
  end
end

require 'spec_helper'

describe AuthorsController do
  describe "POST create" do
    let(:author) {mock_model(Author).as_null_object}
    before(:each) do
      Author.stub(:new).and_return(author)
    end
    it "creates a new author" do
      Author.should_receive(:new).with("last_name" => "Villasica", "first_name" => "Leo").and_return(author)
      post :create, :author => {"last_name" => "Villasica", "first_name" => "Leo"}
    end
    it "saves the author" do
      author.should_receive(:save)
      post :create
    end
    it "redirects to the Author index" do
      post :create
      response.should redirect_to(:action => "index")
    end
    context "when the author saves successfully" do
      it "sets a flash[:notice] message" do
        post :create
        flash[:notice].should eq("The author was saved successfully.")
      end
      it "redirects to the Author index" do
        post :create
        response.should redirect_to(:action => "index")
      end
    end
    context "when the author fails to save" do
      before(:each) do
        author.stub(:save).and_return(false)
      end
      it "assigns @author" do        
        post :create
        assigns[:author].should eq(author)
      end
      it "renders the new template" do
        post :create
        response.should render_template("new")
      end
    end
  end
  describe "PUT update" do
    let(:author) {mock_model(Author).as_null_object}
    before(:each) do
      Author.should_receive(:find).with(author.id).and_return(author)
    end
    it "updates an existing Author" do
      Author.stub(:find).with(author.id).and_return(author)
      author.should_receive(:update_attributes)
      put :update, :id => author.id, :author => {"last_name" => "Villasica", "first_name" => "Leo"}
    end
    it "redirects to the show Author page" do
      put :update, :id => author.id
      response.should redirect_to(:action => "show")
    end
    context "when the author updates successfully" do
      before(:each){put :update, :id => author.id}
      it "sets a flash[:notice] message" do
        flash[:notice].should eq("The author was updated successfully.")
      end
      it "redirects to the show Author page" do
        response.should redirect_to(:action => "show")
      end
    end
    context "when the author fails to update" do
      before(:each) do
        author.stub(:update_attributes).and_return(false)
        put :update, :id => author.id
      end
      it "assigns @author" do      
        assigns[:author].should eq(author)
      end
      it "renders the new template" do
        response.should render_template("edit")
      end
    end
  end
  describe "DELETE destoy" do
    let(:author) {mock_model(Author).as_null_object}
    before(:each) do
      Author.should_receive(:find).with(author.id).and_return(author)
    end
    it "deletes an existing Author" do
      Author.stub(:find).with(author.id).and_return(author)
      author.should_receive(:destroy)
      delete :destroy, :id => author.id
    end
    it "redirects to the Author index" do
      delete :destroy, :id => author.id
      response.should redirect_to(:action => "index")
    end
  end
end

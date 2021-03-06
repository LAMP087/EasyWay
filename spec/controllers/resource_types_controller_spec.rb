require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ResourceTypesController, type: :controller, authenticated: true do
  render_views
  # This should return the minimal set of attributes required to create a valid
  # ResourceType. As you add validations to ResourceType, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ResourceTypesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all resource_types as @resource_types" do
      resource_type = ResourceType.create! valid_attributes
      get :index, {}, valid_session
      assigns(:resource_types).should eq([resource_type])
    end
  end

  describe "GET show" do
    it "assigns the requested resource_type as @resource_type" do
      resource_type = ResourceType.create! valid_attributes
      get :show, {:id => resource_type.to_param}, valid_session
      assigns(:resource_type).should eq(resource_type)
    end
  end

  describe "GET new" do
    it "assigns a new resource_type as @resource_type" do
      get :new, {}, valid_session
      assigns(:resource_type).should be_a_new(ResourceType)
    end
  end

  describe "GET edit" do
    it "assigns the requested resource_type as @resource_type" do
      resource_type = ResourceType.create! valid_attributes
      get :edit, {:id => resource_type.to_param}, valid_session
      assigns(:resource_type).should eq(resource_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ResourceType" do
        expect {
          post :create, {:resource_type => valid_attributes}, valid_session
        }.to change(ResourceType, :count).by(1)
      end

      it "assigns a newly created resource_type as @resource_type" do
        post :create, {:resource_type => valid_attributes}, valid_session
        assigns(:resource_type).should be_a(ResourceType)
        assigns(:resource_type).should be_persisted
      end

      it "redirects to the created resource_type" do
        post :create, {:resource_type => valid_attributes}, valid_session
        response.should redirect_to(ResourceType.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved resource_type as @resource_type" do
        # Trigger the behavior that occurs when invalid params are submitted
        ResourceType.any_instance.stub(:save).and_return(false)
        post :create, {:resource_type => { "name" => "invalid value" }}, valid_session
        assigns(:resource_type).should be_a_new(ResourceType)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ResourceType.any_instance.stub(:save).and_return(false)
        post :create, {:resource_type => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested resource_type" do
        resource_type = ResourceType.create! valid_attributes
        # Assuming there are no other resource_types in the database, this
        # specifies that the ResourceType created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ResourceType.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => resource_type.to_param, :resource_type => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested resource_type as @resource_type" do
        resource_type = ResourceType.create! valid_attributes
        put :update, {:id => resource_type.to_param, :resource_type => valid_attributes}, valid_session
        assigns(:resource_type).should eq(resource_type)
      end

      it "redirects to the resource_type" do
        resource_type = ResourceType.create! valid_attributes
        put :update, {:id => resource_type.to_param, :resource_type => valid_attributes}, valid_session
        response.should redirect_to(resource_type)
      end
    end

    describe "with invalid params" do
      it "assigns the resource_type as @resource_type" do
        resource_type = ResourceType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ResourceType.any_instance.stub(:save).and_return(false)
        put :update, {:id => resource_type.to_param, :resource_type => { "name" => "invalid value" }}, valid_session
        assigns(:resource_type).should eq(resource_type)
      end

      it "re-renders the 'edit' template" do
        resource_type = ResourceType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ResourceType.any_instance.stub(:save).and_return(false)
        put :update, {:id => resource_type.to_param, :resource_type => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested resource_type" do
      resource_type = ResourceType.create! valid_attributes
      expect {
        delete :destroy, {:id => resource_type.to_param}, valid_session
      }.to change(ResourceType, :count).by(-1)
    end

    it "redirects to the resource_types list" do
      resource_type = ResourceType.create! valid_attributes
      delete :destroy, {:id => resource_type.to_param}, valid_session
      response.should redirect_to(resource_types_url(:only_path => true))
    end
  end
end

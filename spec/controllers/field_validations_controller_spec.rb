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

describe FieldValidationsController , type: :controller, authenticated: true do# This should return the minimal set of attributes required to create a valid
  # FieldValidation. As you add validations to FieldValidation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "field_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FieldValidationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all field_validations as @field_validations" do
      field_validation = FieldValidation.create! valid_attributes
      get :index, {}, valid_session
      assigns(:field_validations).should eq([field_validation])
    end
  end

  describe "GET show" do
    it "assigns the requested field_validation as @field_validation" do
      field_validation = FieldValidation.create! valid_attributes
      get :show, {:id => field_validation.to_param}, valid_session
      assigns(:field_validation).should eq(field_validation)
    end
  end

  describe "GET new" do
    it "assigns a new field_validation as @field_validation" do
      get :new, {}, valid_session
      assigns(:field_validation).should be_a_new(FieldValidation)
    end
  end

  describe "GET edit" do
    it "assigns the requested field_validation as @field_validation" do
      field_validation = FieldValidation.create! valid_attributes
      get :edit, {:id => field_validation.to_param}, valid_session
      assigns(:field_validation).should eq(field_validation)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FieldValidation" do
        expect {
          post :create, {:field_validation => valid_attributes}, valid_session
        }.to change(FieldValidation, :count).by(1)
      end

      it "assigns a newly created field_validation as @field_validation" do
        post :create, {:field_validation => valid_attributes}, valid_session
        assigns(:field_validation).should be_a(FieldValidation)
        assigns(:field_validation).should be_persisted
      end

      it "redirects to the created field_validation" do
        post :create, {:field_validation => valid_attributes}, valid_session
        response.should redirect_to(FieldValidation.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved field_validation as @field_validation" do
        # Trigger the behavior that occurs when invalid params are submitted
        FieldValidation.any_instance.stub(:save).and_return(false)
        post :create, {:field_validation => { "field_id" => "invalid value" }}, valid_session
        assigns(:field_validation).should be_a_new(FieldValidation)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FieldValidation.any_instance.stub(:save).and_return(false)
        post :create, {:field_validation => { "field_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested field_validation" do
        field_validation = FieldValidation.create! valid_attributes
        # Assuming there are no other field_validations in the database, this
        # specifies that the FieldValidation created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FieldValidation.any_instance.should_receive(:update_attributes).with({ "field_id" => "1" })
        put :update, {:id => field_validation.to_param, :field_validation => { "field_id" => "1" }}, valid_session
      end

      it "assigns the requested field_validation as @field_validation" do
        field_validation = FieldValidation.create! valid_attributes
        put :update, {:id => field_validation.to_param, :field_validation => valid_attributes}, valid_session
        assigns(:field_validation).should eq(field_validation)
      end

      it "redirects to the field_validation" do
        field_validation = FieldValidation.create! valid_attributes
        put :update, {:id => field_validation.to_param, :field_validation => valid_attributes}, valid_session
        response.should redirect_to(field_validation)
      end
    end

    describe "with invalid params" do
      it "assigns the field_validation as @field_validation" do
        field_validation = FieldValidation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FieldValidation.any_instance.stub(:save).and_return(false)
        put :update, {:id => field_validation.to_param, :field_validation => { "field_id" => "invalid value" }}, valid_session
        assigns(:field_validation).should eq(field_validation)
      end

      it "re-renders the 'edit' template" do
        field_validation = FieldValidation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FieldValidation.any_instance.stub(:save).and_return(false)
        put :update, {:id => field_validation.to_param, :field_validation => { "field_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested field_validation" do
      field_validation = FieldValidation.create! valid_attributes
      expect {
        delete :destroy, {:id => field_validation.to_param}, valid_session
      }.to change(FieldValidation, :count).by(-1)
    end

    it "redirects to the field_validations list" do
      field_validation = FieldValidation.create! valid_attributes
      delete :destroy, {:id => field_validation.to_param}, valid_session
      response.should redirect_to(field_validations_url)
    end
  end

end

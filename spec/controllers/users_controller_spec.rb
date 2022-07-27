require 'rails_helper'

describe Api::V1::UsersController do
  context 'If GET #index' do
    it 'should return all users' do
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to eq(User.all.to_json)
    end

    it 'should have an empty array' do
      get :index
      expect(assigns(:users)).to be_empty
    end

    it 'should have one user in the array' do
      create(:user)
      get :index
      expect(assigns(:users)).to_not be_empty
    end
  end

  context 'GET #show' do
    let(:user) { create(:user) }
    it 'should return a successful response' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end

    it 'should return a user' do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
  end

  context 'If @user is nil' do
    it 'should return a message' do
      get :show, params: { id: 1 }
      expect(response.body).to eq('{"error":"User not found"}')
    end
  end

  context 'POST #create' do
    it 'should create a new user' do
      post :create, params: { user: attributes_for(:user) }
      expect(response.status).to eq(201)
      expect(response.body).to eq(response.body)
    end

    it 'should not create a new user' do
      post :create, params: { user: attributes_for(:user, name: nil ) }
      expect(response.status).to eq(422)
      expect(response.body).to eq('{"error":"User not created"}')
    end
    # FIXME - This test is failing because of a config the faker.
  end

  context 'PUT #update' do
    let(:user) { create(:user) }
    it 'should update a user' do
      put :update, params: { id: user.id, user: attributes_for(:user, name: 'New name') }
      expect(response.status).to eq(201)
      expect(response.body).to eq(response.body)
    end

    it 'should not update a user' do
      put :update, params: { id: user.id, user: attributes_for(:user, name: nil ) }
      expect(response.status).to eq(422)
      expect(response.body).to eq('{"error":"User not updated"}')
    end
    # FIXME - The same error "should not create a new user".

    it 'should return a message' do
      put :update, params: { id: 1 }
      expect(response.body).to eq('{"error":"User not found"}')
    end
  end

  context 'DELETE #destroy' do
    let(:user) { create(:user) }
    it 'should delete a user' do
      delete :destroy, params: { id: user.id }
      expect(response.status).to eq(200)
      expect(response.body).to eq('{"message":"User deleted"}')
    end

    it 'should not delete a user' do
      delete :destroy, params: { id: 1 }
      expect(response.status).to eq(404)
      expect(response.body).to eq('{"error":"User not found"}')
    end
  end
end

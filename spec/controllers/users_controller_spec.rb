require 'rails_helper'

describe Api::V1::UsersController do
  context 'If GET index' do
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

  context 'GET show' do
    let(:user) { create(:user) }
    it 'should return a successful response' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end
  end
end

describe Api::V1::UsersController do
  context 'If @users is not empty' do
    it 'should return a list of users' do
    end
  end
end

describe Api::V1::UsersController do
  context 'If @user is nil' do
    it 'should return a message' do
      get :show, params: { id: 1 }
      expect(response.body).to eq('{"error":"User not found"}')
    end
  end
end

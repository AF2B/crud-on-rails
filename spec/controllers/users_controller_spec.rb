require 'rspec_helper'

describe Api::V1::UsersController do
  context 'If @users is empty' do
    it 'should return a message' do
      get :index
      expect(response.body).to eq('{"message":"No users found"}')
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

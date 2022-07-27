require 'rspec_helper'

describe UsersController do
  context 'when we try to get all users' do
    it 'should return all users' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end

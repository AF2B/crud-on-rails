require 'rails_helper'

describe Api::V1::UsersController do
  context 'GET #index - /api/v1/users' do
    it 'should return all users if have users' do
      FactoryBot.create(:user)
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to include(@users.to_json)
      expect(response.message).to eq('OK')
    end

    it 'should not return users' do
      get :index
      expect(response.status).to eq(404)
      expect(response.body).to eq({ error: 'No users found' }.to_json)
      expect(response.message).to eq('Not Found')
    end
  end

  context 'GET #show - /api/v1/users/:id' do
    it 'should return user if have user' do
      user = FactoryBot.create(:user)
      get :show, params: { id: user.id }
      expect(response.status).to eq(200)
      expect(response.body).to include(user.to_json)
      expect(response.message).to eq('OK')
    end

    it 'should not return user' do
      get :show, params: { id: 1 }
      expect(response.status).to eq(404)
      expect(response.body).to eq({ error: 'User not found' }.to_json)
      expect(response.message).to eq('Not Found')
    end
  end

  # NEED TO FIX THIS CONTEXT
  context 'POST #create - /api/v1/users' do
    it 'should create user' do
      user = FactoryBot.create(:user)
      post :create, params: { name: user.name, email: user.email, cpf: user.cpf, phone: user.phone }
      expect(response.status).to eq(201)
      expect(response.body).to include(user.to_json)
      expect(response.message).to eq('User created')
    end

    it 'should not create user' do
      post :create, params: { name: '', email: 'fakeemail@gmail.com', cpf: '', phone: '' }
      expect(response.status).to eq(422)
      expect(response.body).to eq({ error: 'Name, Email, Cpf and Phone is needed!' }.to_json)
      expect(response.message).to eq('Unprocessable Entity')
    end
  end

  # NEED TO FIX THIS CONTEXT
  context 'PUT #update - /api/v1/users/:id' do
    it 'should update user if params are valid' do
      user = FactoryBot.create(:user)
      put :update, params: { id: user.id, name: user.name, email: user.email }
      expect(response.status).to eq(200)
      expect(response.body).to include(user.to_json)
      expect(response.message).to eq('OK')
    end

    it 'should not update user' do
      user = FactoryBot.create(:user)
      put :update, params: { id: user.id, name: '', email: '' }
      expect(response.status).to eq(422)
      expect(response.body).to eq({ error: 'Name and Email is needed!' }.to_json)
      expect(response.message).to eq('Unprocessable Entity')
    end
  end

  context 'DELETE #destroy - /api/v1/users/:id' do
    # NEED TO FIX THIS
    it 'should delete user' do
      user = FactoryBot.create(:user)
      delete :destroy, params: { id: user.id }
      expect(response.status).to eq(200)
      expect(response.body).to include(user.to_json)
      expect(response.message).to eq('OK')
    end

    it 'should not delete user' do
      delete :destroy, params: { id: 20 }
      expect(response.status).to eq(422)
      expect(response.message).to eq({ error: 'User not deleted, try another time' }.to_json)
    end
  end
end

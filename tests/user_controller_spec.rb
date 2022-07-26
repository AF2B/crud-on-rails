require 'rails_helper'

describe User do
  context 'Testing if User have a method index' do
    it 'should have a method called index' do
      expect(User).to respond_to(:index)
    end
  end
end

describe User do
  context 'Testing if the method update was created' do
    it 'should have a method called update' do
      user_update = User.new
      expect(user_update).to respond_to(:update)
    end
  end
end

describe User do
  context 'Testing index method is a Array' do
    it 'should return an array type.' do
      user_index = User.index
      expect(user_index).to be_a(Array)  
    end
  end
end

describe User do
  context 'Testing if the method index return an array with users' do
    it 'should return an array with users' do
      user_index = User.index
      expect(user_index.length).to be > 0
    end
  end
end

describe User do
  context 'Testing if the User have a method show' do
    it 'should have a method called show' do
      user_method_show = User.new
      expect(user_method_show).to respond_to(:show)
    end
  end
end

describe User do
  context 'Testing if the method show return an object' do
    it 'should return an object type' do
      user_show = User.new
      expect(user_show).to be_a(Object)
    end
  end
end

describe User do
  context 'Testing if the object returning in a method show is an json' do
    it 'should return an json type' do
      user_show_json = User.new
      expect(user_show_json).to be_a(JSON)
    end
  end
end

describe User do
  context 'Testing if the method new is an instance of User' do
    it 'should return an instance of User' do
      user_instance_new = User.new
      expect(user_instance_new).to be_an_instance_of(User)
    

describe User do
  context 'Testing if the method show return an object with user' do
    it 'must return an object with user' do
      user_show_object = User.new
      expect(user_show_object).to be_a(User)
    end
  end
end

describe User do
  context 'when route /users/api/v1 is called' do
    it 'should return a status 200' do
      response = get '/users/api/v1'
      expect(response).to have_http_status(200)
    end
  end
end

describe User do
  context 'Testing if the method create was created' do
    it 'should have a method called create' do
      user_create = User.new
      expect(user_method_create).to respond_to(:create)
    end
  end
end

describe User do
  context 'Testing if the method create after create a user' do
    it 'should return a status 201' do
      user_create = User.new
      if user_create.save
        expect(user_create).to render_template(:create)
        expect(user_create.create).to have_http_status(201)
      else
        expect(user_create).to have_http_status(404)
      end
    end
  end
end

describe User do
  context 'Testing if the class User have these attributes' do
    it ' should have all off these attributes' do
      user_attributes = User.new
      expect(user_attributes).to have_attributes(:name, :email, :dt_of_birth, :cpf, :rg, :address, :city, :state, :country, :phone)
    end
  end
end

describe User do
  context 'Checking if the class User have an validation'
    it 'should have a validation for email' do
      user_validation = User.new
      expect(user_valitation).to validate_presence_of(:email)
    end
  end
end

describe User do
  context 'Checking if the class User have a method called update' do
    it 'should have a method called update' do
      user_update = User.new
      expect(user_update).to respond_to(:update)
    end
  end
end

describe User do
  context 'Testing if the method update after update a user' do
    it 'should return a status 200' do
      user_update = User.new
      if user_update.save
        expect(user_update).to render_template(:update)
        expect(user_update.update).to have_http_status(200)
      else
        expect(user_update).to have_http_status(404)
      end
    end
  end
end

describe User do
  context 'Testing if the method destroy take an id and destroyied the user' do
    it 'should return a status 200 if the user was deleted' do
      user_destroy = User.new
      if user_destroy.destroy(User.find(params[:id]))
        expect(user_destroy).to render_template(:destroy)
        expect(user_destroy.destroy).to have_http_status(200)
        expect(user_destroy.destroy).to notify(:success, 'Usuário excluído com sucesso!')
      else
        expect(user_destroy).to have_http_status(404)
      end
    end
  end
end

describe User do
  context 'Testing if the method destroy return a status 404' do
    it 'should return a status 404' do
      user_destroy = User.new
      if user_destroy != User.find(params([:id])) 
        expect(user_destroy).to have_http_status(404)
      end
    end
  end
end

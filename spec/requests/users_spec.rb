require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "User Controller" do
    user_params = {
      "email": "test3@gmail.com",
      "password": "test",
      "user_name": "test4",
      "f_name": "test",
      "l_name": "test",
      "phone": "99999444993"
    }
    it 'Should create a user' do
       post '/users', params: user_params
       resp = JSON.parse(response.body)
       expect(resp['status']).to eq(200)
    end

    it 'Should fail a user trying to create duplicate user' do
      # ignoring with duplicate email, phone
      User.create(user_params)
      post '/users', params: user_params
      resp = JSON.parse(response.body)
      expect(resp['status']).to eq(500)
      expect(resp['message']).to eq('Validation failed: User name Already Exist, Email Already Exist, Phone Already Exist')
   end



  end
end

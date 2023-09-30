require 'rails_helper'

RSpec.describe "Tutors", type: :request do
  describe "POST /tutors" do
   params =   {"user_name": "test4","course_name": "Maths" }
    it 'Should fail since there is no user and no course' do
      post '/tutors', params: params
      resp = JSON.parse(response.body)
      expect(resp['status']).to eq(500)
      expect(resp['message']).to eq('Validation failed: User must exist, Course must exist')
    end


    it 'Should fail since there is no user' do
      course_params = {"name": "Maths", "desc": "test"}
      resp = Course.create(course_params)
      post '/tutors', params: params
      resp = JSON.parse(response.body)
      expect(resp['status']).to eq(500)
      expect(resp['message']).to eq('Validation failed: User must exist')
    end

    it 'Should create Tutor' do
      course_params = {"name": "Maths", "desc": "test"}
      user_params = {
        "email": "test3@gmail.com",
        "password": "test",
        "user_name": "test4",
        "f_name": "test",
        "l_name": "test",
        "phone": "99999444993"
    }
      resp = Course.create(course_params)
      resp = User.create(user_params)
      post '/tutors', params: params
      resp = JSON.parse(response.body)
      expect(resp['status']).to eq(200)
    end
  end
end

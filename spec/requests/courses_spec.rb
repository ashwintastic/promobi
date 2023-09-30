require 'rails_helper'

RSpec.describe "Courses", type: :request do
  describe "GET /courses_with_tutors" do
    it 'Display courses with tutors' do
      get '/courses_with_tutors'
      resp = JSON.parse(response.body)
      expect(resp['status']).to eq(200)
    end
  end
end

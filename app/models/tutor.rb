class Tutor < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :user_id, uniqueness: {message:  I18n.t('model')[:tutor][:attributes][:user_id][:unique] }


  class << self
    def create_tutor(params)
      begin
        ActiveRecord::Base.transaction do
          user = User.find_by(user_name: params[:user_name])
          course = Course.find_by(name: params[:course_name])
          tutor = Tutor.create!(user: user, course: course)
          { status: 200, message: 'Tutor Created' }
        end
      rescue => err
        return { status: 500, message: err.message}
      end
    end
  end
end

class Course < ApplicationRecord
  has_many :tutors
  validates :name,  uniqueness: { message: I18n.t('model')[:course][:attributes][:name][:unique] }

  class << self
    def fetch_tutors_and_courses
      begin
        # Ignoring pagination as of now
        # Tutor.joins(:course).joins(:user).all
        Tutor.joins(:course).joins(:user).select('courses.name','courses.desc' , 'users.*')
      rescue => err
        return { status: 500, message: err.message }
      end
    end
  end
end

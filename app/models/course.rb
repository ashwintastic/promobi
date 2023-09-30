class Course < ApplicationRecord
  has_many :tutors
  validates :name,  uniqueness: { message: I18n.t('model')[:course][:attributes][:name][:unique] }

  class << self
    def fetch_tutors_and_courses
      begin
        # Ignoring pagination as of now
        resp = Tutor.joins(:course).joins(:user).select(
        'courses.name as course_name',
         'users.user_name',
         'users.f_name',
         'users.l_name',
         'users.phone',
         'users.email',
         'users.id as tutor_id'
         )

         { status: 200 , message: resp.group_by { |d| d[:course_name] } }

      rescue => err
        return { status: 500, message: err.message }
      end
    end
  end
end

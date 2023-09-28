class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name, index: { unique: true }
      t.string :desc
      t.timestamps
    end
  end
end

class CreateTutors < ActiveRecord::Migration[7.0]
  def change
    create_table :tutors do |t|
      t.references :user, null: false, foreign_key: true, dependent: :destroy, index: {unique: true}
      t.references :course, null: false, foreign_key: true, dependent: :destroy
      t.timestamps
    end
  end
end

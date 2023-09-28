class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_name, index: { unique: true }
      t.string :f_name
      t.string :l_name
      t.string :email, index: { unique: true }
      t.string :password
      t.string :phone, index: { unique: true }

      t.timestamps
    end
  end
end

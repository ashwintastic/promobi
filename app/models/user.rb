class User < ApplicationRecord

  validates :user_name, uniqueness: {message:  I18n.t('model')[:user][:attributes][:user_name][:unique] }
  validates :email,  uniqueness: {message: I18n.t('model')[:user][:attributes][:email][:unique] }
  validates :phone, uniqueness: {message: I18n.t('model')[:user][:attributes][:phone][:unique] }

end

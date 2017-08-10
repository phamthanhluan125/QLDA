class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :time_scr, :birthday, :gender, :avatar, :authentication_token,
    :address, :status, :created_at
  belongs_to :role
end

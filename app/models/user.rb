class User < ApplicationRecord
    validates :email,presence: true
    validates :name,presence: true,length: {maximum: 20}
end

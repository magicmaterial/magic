class User < ApplicationRecord
    validates :email,presence: true
    validates :name,presence: true,length: {maximum: 20}
    
    def posts
        return Post.where(user_id: self.id)
    end
end

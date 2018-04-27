class Post < ApplicationRecord
    validates :content,presence: true,length: {maximum: 20}
    validates :user_id,presence: true
    
    def users
        return User.find_by(id: self.user_id)
    end
    default_scope -> { order(created_at: :desc) }
end

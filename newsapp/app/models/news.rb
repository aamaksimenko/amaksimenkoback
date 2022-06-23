class News < ApplicationRecord    
    belongs_to :user
    validates :title, :article, :tag, :author, presence:true
end

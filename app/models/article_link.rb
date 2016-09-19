class ArticleLink < ActiveRecord::Base
    scope :recent, lambda { order('created_at DESC').limit(10) }
    
    validates_presense_of :url
end

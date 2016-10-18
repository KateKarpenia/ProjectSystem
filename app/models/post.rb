class Post < ActiveRecord::Base

  belongs_to :user
  belongs_to :project
  
  validates :content, presence: true, length: { maximum: 255 }
  # validates :user_id, presence: true
  validates :project_id, presence: true


end

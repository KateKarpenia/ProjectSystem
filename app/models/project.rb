class Project < ActiveRecord::Base
	
	belongs_to :team
	has_many :posts, dependent: :destroy
	has_many :users, through: :posts
	
	validates :team_id, presence: true
	validates :name, presence: true,
					length: {minimum: 5}
	validates :summary, presence: true,
					length: {maximum: 255}
	

end

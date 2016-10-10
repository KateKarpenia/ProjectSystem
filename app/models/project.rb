class Project < ActiveRecord::Base
	
	belongs_to :team
	validates :team_id, presence: true
	validates :name, presence: true,
					length: {minimum: 5}
	validates :summary, presence: true,
					length: {maximum: 255}
	

end

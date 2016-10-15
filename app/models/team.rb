class Team < ActiveRecord::Base

	has_many :users
	has_many :projects
	
	accepts_nested_attributes_for :users
	
	validates :name, presence: true,
					length: {minimum: 3}
					
	def self.build
		team = self.new
		team.user.build.posts.build_project
	end

end

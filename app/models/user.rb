class User < ActiveRecord::Base

	after_initialize :default_values

	belongs_to :team
	
	has_many :posts
	has_many :projects, through: :posts
	
	accepts_nested_attributes_for :posts
	
	validates :team_id, presence: false
	
	before_save { self.email = email.downcase }
	validates :first_name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, 	presence: true, format: { with: VALID_EMAIL_REGEX }, 
						uniqueness: { case_sensitive: false }
	#has_secure_password
  	validates :password, length: { minimum: 6 }
  	


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
    def admin?
    	admin
	end
	
	private
    def default_values
      self.team_id ||= "1"
    end
         
end

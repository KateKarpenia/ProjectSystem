namespace :db do 

	desc "Fill database with sample data"
	task populate: :environment do
		User.create!(first_name: "Example Name",
					last_name: "Example Last Name",
					email: "example@info.com",
					password: "123456",
					password_confirmation: "123456",
					admin: "false")
		300.times do |n|
			first_name = Faker::Name.first_name
			last_name = Faker::Name.last_name
			email = Faker::Internet.free_email
			password = "123456"
			User.create!(first_name: first_name,
						last_name: last_name,
						email: email,
						password: password,
						password_confirmation: password)
		end

	end

	
end
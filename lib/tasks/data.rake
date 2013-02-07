namespace :db do 
	desc "Add the pages"
	task pages: :environment do
		Page.new(name: 'presentation')
		Page.new(name: 'vision')
		Page.new(name: 'contact')
		Page.new(name: 'links')
		User.new(name: 'Admin', password: '12341', password_confirmation: '12341')
	end
end
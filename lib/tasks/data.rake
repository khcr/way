namespace :db do 
	desc "Add the pages"
	task pages: :environment do
		Page.create(name: 'presentation')
		Page.create(name: 'vision')
		Page.create(name: 'contact')
		Page.create(name: 'links')
		User.create(name: 'Admin', password: '12341', password_confirmation: '12341')
	end
end
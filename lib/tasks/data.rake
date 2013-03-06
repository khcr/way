namespace :db do 
	desc "Add the pages"
	task pages: :environment do
		Page.create(name: 'presentation', title: 'title', content: 'content')
		Page.create(name: 'vision', title: 'title', content: 'content')
		Page.create(name: 'contact', title: 'title', content: 'content')
		Page.create(name: 'links', title: 'title', content: 'content')
		User.create(name: 'admin', password: '12341', password_confirmation: '12341', level: 2)
	end
end
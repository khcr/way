namespace :db do 
	desc "Add the pages"
	task pages: :environment do
		Page.create(name: 'presentation', title: 'title', content: 'content')
		Page.create(name: 'vision', title: 'title', content: 'content')
		Page.create(name: 'contact', title: 'title', content: 'content')
		User.create(name: 'admin', password: '12341', password_confirmation: '12341', level_id: 3)
	end
	desc "Add the events types"
	task type_events: :environment do
		TypeEvents.create(name: 'GPS')
		TypeEvents.create(name: 'Actu')
		TypeEvents.create(name: 'Youth')
		TypeEvents.create(name: 'Extra')
		TypeEvents.create(name: 'Inter-GDJ')
		TypeEvents.create(name: 'Culte')
		TypeEvents.create(name: 'Event')
		TypeEvents.create(name: 'Autre')
	end
	desc "Add the levels"
	task levels: :environment do
		Level.create(name: 0)
		Level.create(name: 1)
		Level.create(name: 2)
	end
end
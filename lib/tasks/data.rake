namespace :db do 
	desc "Add the pages"
	task pages: :environment do
		Page.destroy_all
		User.destroy_all

		Page.create(name: 'presentation', title: 'title', content: 'content')
		Page.create(name: 'vision', title: 'title', content: 'content')
		Page.create(name: 'contact', title: 'title', content: 'content')
		User.create(name: 'admin', password: '12341', password_confirmation: '12341', level_id: 3)
	end
	desc "Add the events types"
	task type_events: :environment do
		TypeEvents.destroy_all

		TypeEvents.create(name: 'Talk-up')
		TypeEvents.create(name: 'Stand-up')
		TypeEvents.create(name: 'Bible-up')
		TypeEvents.create(name: 'One Life')
		TypeEvents.create(name: 'Event')
	end
	desc "Add the levels"
	task levels: :environment do
		Level.destroy_all

		Level.create(name: 0)
		Level.create(name: 1)
		Level.create(name: 2)
	end
end
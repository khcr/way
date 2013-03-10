atom_feed do |feed|
	feed.title 'Events du groupe de jeunes'
	feed.updated @events.maximum(:updated_at)

	@events.each do |event|
		feed.entry(event, plublished: event.date) do |entry|
			entry.title event.theme
			entry.content event.info
			entry.author do |author|
				author.name 'Lead WAY'
			end
		end
	end
end
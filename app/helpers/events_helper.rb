module EventsHelper

	def sort_event(event)
		type_soiree = event.type_events.name

		if type_soiree == 'GPS'
			icon = 'marker_blue.png'
		elsif type_soiree == 'Extra'
			icon = 'marker_green.png'
		elsif type_soiree == 'Actu'
			icon = 'marker_orange.png'
		elsif type_soiree == 'Culte'
			icon = 'marker_grey.png'
		elsif type_soiree == 'Youth'
			icon = 'marker_darkred.png'
		elsif type_soiree == 'Inter-GDJ'
			icon = 'marker_pink.png'
		elsif type_soiree == 'Event'
			icon = 'marker_violet.png'
		else
			icon = 'marker_lightgrey.png'
		end

		return icon
	end

	def match_event(day)
		result = nil
		@events.each do |event|
			if event.date == day
				result = event
			else
				result = nil
			end
			break if result
		end
		return result
	end

end

module EventsHelper

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

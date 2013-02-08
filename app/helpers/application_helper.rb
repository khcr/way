module ApplicationHelper

	def french_date_short(date)
		french_month = ['janv.', 'fev.', 'mars', 'avril', 'mai', 'juin', 'juill.', 'auot', 'sept.', 'oct.', 'nov', 'dec.']
		return date.strftime('%d ') + french_month[date.strftime('%m').to_f - 1] # il faut convertire ce con en numbre avant
	end

end

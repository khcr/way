module ApplicationHelper

	def french_date_short(date)
		french_month = ['janv.', 'fev.', 'mars', 'avril', 'mai', 'juin', 'juill.', 'auot', 'sept.', 'oct.', 'nov', 'dec.']
		return date.strftime('%d ') + french_month[date.strftime('%m').to_f - 1] # il faut convertire ce con en numbre avant
	end

	def shorti_text(text, size)
		return text.to_s.gsub(/^(.{#{size}}[\w.]*)(.*)/) {$2.empty? ? $1 : $1 + '...'}
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.fullpath
	end

	# Used for nav
	def is_active?(page_name)
  	"selected" if params[:action] == page_name
	end

	def present(table)
		render 'shared/table', presenter: table
	end

end

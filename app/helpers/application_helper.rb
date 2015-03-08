module ApplicationHelper

	def shorti_text(text, size)
		return text.to_s.gsub(/^(.{#{size}}[\w.]*)(.*)/) {$2.empty? ? $1 : $1 + '...'}
	end

	def is_active?(page_name)
  	"selected" if params[:action] == page_name
	end

end

module ApplicationHelper
	def time_format time
		time.strftime("%a %B %d, %Y") if time.present?
	end
end

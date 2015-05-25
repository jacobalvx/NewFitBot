module ApplicationHelper
	def flash_message
		if flash[:alert]
			flash[:alert]
		elsif flash[:notice]
			flash[:notice]
		end

	end
end

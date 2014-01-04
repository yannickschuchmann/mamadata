module ApplicationHelper

	def is_admin?
		if current_user.role == "admin"
			return true
		else
			return false
		end
	end

	def is_editor?
		if current_user.role == "editor"
			return true
		else
			return false
		end
	end

	def is_supporter?
		if current_user.role == "supporter"
			return true
		else
			return false
		end
	end
end
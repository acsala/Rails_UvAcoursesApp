class Cart < ActiveRecord::Base
	# The :dependent => :destroy part indicates that the existence of line items is dependent on the existence of the cart.
	has_many :line_course, :dependent => :destroy
	
	#checks whether our list of items already includes the course we’re adding; if it does, it bumps the quantity, and if it doesn’t, it builds a new 			LineCourse
	def add_course(course_id)
		current_course = line_course.find_by_course_id(course_id)
		if current_course
    		current_course.quantity += 1
		else
    		current_course = line_course.build(:course_id => course_id)
		end
  		current_course
	end
	
end

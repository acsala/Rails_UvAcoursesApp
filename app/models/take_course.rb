class TakeCourse < ActiveRecord::Base

	belongs_to :course
	belongs_to :cart
	
end

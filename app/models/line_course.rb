class LineCourse < ActiveRecord::Base

	belongs_to :course
	belongs_to :cart

end

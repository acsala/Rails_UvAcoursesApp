class Course < ActiveRecord::Base
  has_many :line_courses
  
#  def self.search(search)
#  		search_condition = "%" + search + "%"
#  		find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
#	end
	
	def self.search(query)
		# where(:title, query) -> This would return an exact match of the query
		where("Name like ?", "%#{query}%") 
	end
	
end

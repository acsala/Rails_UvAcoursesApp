Design document of UvAcoursesApp
=============

- a list of database tables and fields (and their types) that you’ve decided to implement;

- a list of classes and methods (and their return types and/or arguments) that you’ve decided to implement;

- photos of whiteboard drawings;

- more advanced sketches of UIs.

# Section 1 – Purpose of project/sub-system
Mobile web app that allows users to shop for University of Amsterdam courses. Course data is mainained from an xml file and 
is loaded into SQLite tables.
<br>Users are able to browse courses, search courses by keywords,
add courses to lists (Courses_I'm_shopping/Courses_I'm_taking), browse recently viewed courses.

# Section 2 – List of database tables and fields

Table courses fields:

    t.string   "Name"
    t.integer  "Ects"
    t.string   "Institute"
    t.string   "Programme"
    t.text     "Description"
    t.datetime "created_at"
    t.datetime "updated_at"

Table User field:
    
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"

Table Carts field:

    t.datetime "created_at"
    t.datetime "updated_at"

Table line_courses field:

    t.integer  "course_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    
Table shoppings field:

    t.integer  "Course_ID"
    t.integer  "User_ID"
    t.datetime "created_at"
    t.datetime "updated_at"
    
Table take_courses field:

    t.integer  "course_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"

# Section 3 – A list of classes and methods

<b>Models:

Implemented models:
<ul><i>
<li>User</li>
<li>Course</li>
<li>Cart</li>
<li>Line_Course</li>
<li>Take_course</li>

Cart is implemented for supporting Line_Course (these are the courses the user are willing to shop) and Take_Course
(these are the courses the user takes).

</ul>

    class User < ActiveRecord::Base
      may have many courses
      attr_accessible :name, :uniqueness => true
    end
	
-
    
    class Course < ActiveRecord::Base
      has_many :line_courses
      has_many :take_courses
      
    #  def self.search(search)
    #  		search_condition = "%" + search + "%"
    #  		find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
    #	end
    	
    	def self.search(query)
    		# where(:title, query) -> This would return an exact match of the query
    		where("Name like ?", "%#{query}%") 
    	end
    	
    end
	
-
    
    class Cart < ActiveRecord::Base
	# The :dependent => :destroy part indicates that the existence of line items is dependent on the existence of the cart.
	has_many :line_course, :dependent => :destroy
	has_many :take_course, :dependent => :destroy
	
-
    class LineCourse < ActiveRecord::Base
    
    	belongs_to :course
    	belongs_to :cart
    
    end
	
-
    
    class TakeCourse < ActiveRecord::Base

	belongs_to :course
	belongs_to :cart
	
    end

<b>Views
<ul>
<li>layouts/application.html.erb
general site layout, every otherher view is going to inherit this</li>

<li>course/index.html.erb
Browsing_Courses Page, courses from the database are listed here
<img src="/Browsing_Courses%20(2).png" alt="Browsing_Courses">
</li>
<li>course/show.html.erb
Clicked_On_Course Page, display details of a specific course
<img src="/Clicked_On_Course%20(6).png" alt="Clicked_On_Course">
</li>
<li>course/shopping.html.erb
Courses_I'm_shopping Page, display courses the user added to his/hir shopping list
<img src="/Courses_I'm_shopping%20(3).png" alt="Courses_I'm_shopping">
</li>
<li>course/taking.html.erb
Courses_I'm_taking Page, show courses the user added to his/her courses i'm taking list
<img src="/Courses_I'm_taking%20(4).png" alt="Courses_I'm_taking">
</li>
</ul>

<p><b>Controllers</p>
The controllers are generated with scaffold command, therefor index, show, new, edit, create, update and destroy
classes are automaticly created for every model.

The application is going to render it's pages, the main page is courses_index page, which is rendered into the
application.html.erb template. Through this template, all the other available pages will be shown by a tabbing
in JavaScript.

To get this all work, the following extra classes are added to controlers:

    class CoursesController < ApplicationController
      before_action :set_course, only: [:show, :edit, :update, :destroy]
    
      # GET /courses
      # GET /courses.json
      def index
        @courses = Course.all
        @cart = current_cart
        
        @line_courses = LineCourse.all
        
        
        if params[:search]
    			@search = Course.search(params[:search]).order("created_at DESC")
    		else
    
    			@search = Course.all.order('created_at DESC')
    		end
      end
	
-
    class ApplicationController < ActionController::Base
      # Prevent CSRF attacks by raising an exception.
      # For APIs, you may want to use :null_session instead.
      protect_from_forgery with: :exception
      
    	#The current_cart starts by getting the :cart_id from the session object and then attempts to find a cart corresponding to this id. If such a cart 			record is not found (which will happen if the id is nil or invalid for any reason), then this method will proceed to create a new Cart, store the id 			of the created cart into the session, and then return the new cart.
    	
    	#Note that we place the current_cart method in the ApplicationController and mark it as private. This makes this method available only to controllers 	and fur- thermore prevents Rails from ever making it available as an action on the controller.
      private
    		def current_cart
    			Cart.find(session[:cart_id])
    		rescue ActiveRecord::RecordNotFound
    			cart = Cart.create
    			session[:cart_id] = cart.id
    			cart
      		end
      #---------
      
      
    end
	
-
    class LineCoursesController < ApplicationController
    def create
  		#find the shopping cart for the current session (creating one if there isn’t one there already), add the selected product to that cart, and 				display the cart contents
    @cart = current_cart
    #use the params object to get the :product_id parameter from the request
		
		course = Course.find(params[:course_id])
		
		#pass that product we found into @cart.line_items.build. This causes a new line item relationship to be built between the @cart object and the 			product
		@line_course = @cart.add_course(course.id)
    
    
    
# Style guide

Commenting & Documentation

    Preferebly comment on each function, short descreption about it's purpose (I'm not going to comment out
    code that is generated with scaffolds though)

Indentation

    Preferred identation style:

    def create
      @course = Course.new(course_params)
      
      respond_to do |format|
        if @course.save
          format.html { redirect_to @course, notice: 'Course was successfully created.' }
          format.json { render action: 'show', status: :created, location: @course }
        else
          format.html { render action: 'new' }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    end

Code Grouping

    Code lines that are that are suppose to serve the same task are going to be arringed in blocks and these
    blocks will be separated with spaces.

Naming Scheme
    
    Prefer usage of camelCase, such as: NewObjec, PriceIndex etc..
    
DRY Principle

    The same piece of code should not be repeated over and over again.

No Deep Nesting

    Preferablu reduce level of nesting, 

Limited Line Length

    Avoid writing horizontally long lines of code.

Capitalize SQL Special Words

    Capitalize SQL special words and function names to to distinguish them from your table and column names.
    
Source for style document:
<a href='http://net.tutsplus.com/tutorials/html-css-techniques/top-15-best-practices-for-writing-super-readable-code/'>
Top 15+ Best Practices for Writing Super Readable Code</a>
    


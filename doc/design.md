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

Table Course fields:
<ul><i>
<li>Name</li>
<li>Ects</li>
<li>Year</li>
<li>Institute</li>
<li>Course_ID</li>
<li>Description</li>
</ul>

Table User field:
<ul><i>
<li>User_ID</li>
<li>Name</li>
</ul>

Table Shopping_List field:
<ul><i>
<li>User_ID</li>
<li>Course_ID</li>
</ul>

Table Courses_Taking field:
<ul><i>
<li>User_ID</li>
<li>Course_ID</li>
</ul>

# Section 3 – A list of classes and methods

<b>Models:

There is two models going to be implemented:
<ul><i>
<li>User</li>
<li>Course</li>
</ul>

    class User < ActiveRecord::Base
      may have many courses
      attr_accessible :name, :uniqueness => true
    end
    class Course < ActiveRecord::Base
      may belong to :user
      attr_accessible :name, :ects, :year, :institute, :description
      validates :name, :uniqueness => true
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
Two controllers are going to be implemented: Users and Courses.

class UsersController < ApplicationController
for Users, index, create, show methods are planned to be implemented
end

class CoursesController < ApplicationController
  def index # this method will suplement Browsing_Courses Page / index view
    @courses = Course.all
  end
  
  def show # show method will suplement Clicked_On_Course Page
    @course = Course.find(params[name, ects, year, etc...])
  end
  
  def shopping
    @courses = Shopping_List.all # this method should look up all the course ids in Shoppinglist and pull the names
    from the Course table
  end
  
  def taking
    @courses = Courses_Taking.all # similar to shopping but querying CourseTaking
  end
end

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
    


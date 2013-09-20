class TakeCoursesController < ApplicationController
  before_action :set_take_course, only: [:show, :edit, :update, :destroy]

  # GET /take_courses
  # GET /take_courses.json
  def index
    @take_courses = TakeCourse.all
  end

  # GET /take_courses/1
  # GET /take_courses/1.json
  def show
   @cart = current_cart
  end

  # GET /take_courses/new
  def new
    @take_course = TakeCourse.new
  end

  # GET /take_courses/1/edit
  def edit
  end

  # POST /take_courses
  # POST /take_courses.json
  def create
    #@take_course = TakeCourse.new(take_course_params)
    
    #find the shopping cart for the current session (creating one if there isn’t one there already), add the selected product to that cart, and 				display the cart contents
    @cart = current_cart
    #use the params object to get the :product_id parameter from the request
		
		course = Course.find(params[:course_id])
		
		#pass that product we found into @cart.line_items.build. This causes a new line item relationship to be built between the @cart object and the 			product
		
		@take_course = @cart.take_course.build(:course_id => course)

    respond_to do |format|
      if @take_course.save
        format.html { redirect_to(courses_path)}
        format.json { render action: 'show', status: :created, location: @take_course }
      else
        format.html { render action: 'new' }
        format.json { render json: @take_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /take_courses/1
  # PATCH/PUT /take_courses/1.json
  def update
    respond_to do |format|
      if @take_course.update(take_course_params)
        format.html { redirect_to @take_course, notice: 'Take course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @take_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /take_courses/1
  # DELETE /take_courses/1.json
  def destroy
    @take_course.destroy
    respond_to do |format|
      format.html { redirect_to take_courses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_take_course
      @take_course = TakeCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def take_course_params
      params.require(:take_course).permit(:course_id, :cart_id)
    end
end

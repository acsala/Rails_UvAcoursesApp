class CreateTakeCourses < ActiveRecord::Migration
  def change
    create_table :take_courses do |t|
      t.integer :course_id
      t.integer :cart_id

      t.timestamps
    end
  end
end

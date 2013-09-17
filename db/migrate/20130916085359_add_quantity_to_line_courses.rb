class AddQuantityToLineCourses < ActiveRecord::Migration
  def change
    add_column :line_courses, :quantity, :integer, :default => 1
  end
end

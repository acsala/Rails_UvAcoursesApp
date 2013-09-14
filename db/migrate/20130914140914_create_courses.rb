class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :Name
      t.integer :Ects
      t.string :Institute
      t.string :Programme
      t.text :Description

      t.timestamps
    end
  end
end

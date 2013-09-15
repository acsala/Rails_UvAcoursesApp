class CreateShoppings < ActiveRecord::Migration
  def change
    create_table :shoppings do |t|
      t.integer :Course_ID
      t.integer :User_ID

      t.timestamps
    end
  end
end

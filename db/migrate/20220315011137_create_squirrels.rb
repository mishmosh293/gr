class CreateSquirrels < ActiveRecord::Migration[6.0]
  def change
    create_table :squirrels do |t|
      t.string :name
      t.string :description
      t.integer :age

      t.timestamps
    end
  end
end

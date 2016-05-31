class CreateFashions < ActiveRecord::Migration
  def change
    create_table :fashions do |t|

      t.timestamps null: false
    end
  end
end

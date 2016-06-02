class CreateBeauties < ActiveRecord::Migration
  def change
    create_table :beauties do |t|

      t.timestamps null: false
    end
  end
end

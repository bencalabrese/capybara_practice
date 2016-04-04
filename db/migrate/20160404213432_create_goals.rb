class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false, index: true
      t.string :body, null: false
      t.boolean :completed, default: false
      t.boolean :private, default: false

      t.timestamps null: false
    end
  end
end

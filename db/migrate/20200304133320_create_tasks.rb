class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :content
      t.boolean :state

      t.timestamps
    end
end
end
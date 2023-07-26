class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :action
      t.datetime :activity_time

      t.timestamps
    end
  end
end

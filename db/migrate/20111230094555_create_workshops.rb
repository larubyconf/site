class CreateWorkshops < ActiveRecord::Migration
  def self.up
    create_table :workshops do |t|
      t.string :tag
      t.string :title
      t.date :scheduled_date
      t.string :url
      t.string :instructor_name
      t.string :instructor_twitter
      t.string :instructor_email
      t.timestamps
    end
  end

  def self.down
    drop_table :workshops
  end
end

class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :summary
      t.datetime :start_date
      t.datetime :end_date
      
      #t.integer :team_id
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

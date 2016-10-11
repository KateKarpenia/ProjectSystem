class AddTeamRefsToProject < ActiveRecord::Migration
  def change
  	add_reference :projects, :team, index: true
  end
end

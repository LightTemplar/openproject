class ProjectsLftRgtIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :projects, %i[lft rgt], unique: true
  end
end

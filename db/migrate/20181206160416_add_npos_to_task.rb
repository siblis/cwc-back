class AddNposToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :npos, :integer, index: true
  end
end

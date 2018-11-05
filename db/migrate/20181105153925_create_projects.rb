class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :body
      t.timestamp :deadline

      t.timestamps
    end
  end
end

class AddNposToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :npos, :integer, index: trueб , comment: 'Позиция в списке'
  end
end

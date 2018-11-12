class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks, comment: 'Задачи' do |t|
      t.string :title, comment: 'Заголовок'
      t.text :body, comment: 'Описание'
      t.timestamp :deadline, comment: 'Планируемое окончание'
      t.boolean :completed, comment: 'Выполнено'
      t.timestamp :started, comment: 'Начато'
      t.integer :project_id, comment: 'ID проекта'

      t.timestamps
    end
  end
end

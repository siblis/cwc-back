class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects, comment: 'Проекты' do |t|
      t.string :title, comment: 'Заголовок'
      t.text :body, comment: 'Описание'
      t.datetime :deadline, comment: 'Планируемое окончание'
      t.boolean :completed, comment: 'Выполнено'
      t.datetime :started, comment: 'Начато'

      t.timestamps
    end
  end
end

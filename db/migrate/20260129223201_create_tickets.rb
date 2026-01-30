class CreateTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.string :status
      t.string :priority
      t.integer :assignee_id
      t.integer :reporter_id
      t.date :due_date
      t.string :tags

      t.timestamps
    end
  end
end

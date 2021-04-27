class CreateTagAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_assignments do |t|
      t.references :task, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end

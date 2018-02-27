class CreateManuscripts < ActiveRecord::Migration[5.1]
  def change
    create_table :manuscripts do |t|
      t.string :company
      t.string :title
      t.string :job_content
      t.string :remarks

      t.timestamps
    end
  end
end

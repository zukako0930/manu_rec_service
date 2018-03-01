class CreateManuscripts < ActiveRecord::Migration[5.1]
  def change
    create_table :manuscripts do |t|
      t.string :company
      t.string :title
      t.text :job_content
      t.text :remarks

      t.timestamps
    end
  end
end

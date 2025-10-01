class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :student_number
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end

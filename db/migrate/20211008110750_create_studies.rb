class CreateStudies < ActiveRecord::Migration[6.0]
  def change
    create_table :studies do |t|
      t.string        :title
      t.string        :language
      t.string        :framework
      t.text          :content
      t.references    :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

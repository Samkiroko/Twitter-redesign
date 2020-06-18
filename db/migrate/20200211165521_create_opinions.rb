class CreateOpinions < ActiveRecord::Migration[5.2]
  def change
    create_table :opinions do |t|
      t.references :user, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end

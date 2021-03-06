class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.references :user, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end

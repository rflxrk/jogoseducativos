class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :category, index: true
      t.string :puzzle

      t.timestamps
    end
  end
end

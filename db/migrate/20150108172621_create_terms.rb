class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.text :body

      t.timestamps null: false
    end
  end
end

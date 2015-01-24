class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :title
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end
end

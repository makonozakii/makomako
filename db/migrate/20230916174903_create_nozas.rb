class CreateNozas < ActiveRecord::Migration[6.1]
  def change
    create_table :nozas do |t|
      t.string :name
      t.string :image
      t.text :content

      t.timestamps
    end
  end
end

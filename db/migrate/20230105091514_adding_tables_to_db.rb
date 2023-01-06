class AddingTablesToDb < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t|
      t.integer :value
      t.timestamps
    end

    create_table :users do |t|
      t.string :name
      t.timestamps
    end

    create_table :scripts do |t|
      t.string :script_type
      t.text :content
      t.timestamps
    end
  end
end

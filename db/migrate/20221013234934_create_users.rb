class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :wallet
      t.boolean :is_admin

      t.timestamps
    end
  end
end

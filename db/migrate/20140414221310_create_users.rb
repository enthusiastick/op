class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :handle, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :provider, null: false
      t.string :omniauth_id, null: false

      t.timestamps
    end
  end
end

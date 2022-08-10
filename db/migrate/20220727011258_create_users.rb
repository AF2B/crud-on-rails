class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :cpf, null: false
      t.string :cnpj, null: true
      t.string :dt_of_birth, null: true
      t.string :address, null: true
      t.string :city, null: true
      t.string :country, null: true
      t.string :phone, null: true

      t.timestamps
    end
  end
end

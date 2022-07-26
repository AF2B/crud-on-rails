class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :dt_of_birth
      t.string :cpf
      t.string :cnpj
      t.string :address
      t.string :city
      t.string :state
      t.string :phone
  end
end
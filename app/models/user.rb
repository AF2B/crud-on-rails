class User < ActiveRecord
  attr_accessor :name, :email, :dt_of_birth, :cpf, :rg, :address, :city, :state, :phone

  validates :my_email_attribute, email: {mode: :strict, require_fqdn: true}
end
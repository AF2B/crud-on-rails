class User < ApplicationRecord
  validates my_email_attribute, email: {mode: :strict, require_fqdn: true}
end

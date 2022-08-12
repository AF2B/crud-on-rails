require 'rails_helper'

describe User, :type => Model do
  context 'method phone_number_valid?' do
    it 'should return true if phone number is valid' do
      expect(User.phone_number_valid?('(11) 9999-9999')).to eq(true)
    end

    it 'should return false' do
      expect(User.phone_number_valid?('(11) 9999-99999')).to eq(false)
    end
  end
end
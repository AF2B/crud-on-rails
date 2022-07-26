require 'rails_helper'
include ValidationsModule

describe DataValidations do
  context 'Testing if the module validations_module have a class CpfValidation' do
    it 'should be a class' do
      expect(DataValidations::CpfValidation).to be_a(Class)
    end
  end
  
  context 'Testing if the module validations_module have a class CnpjValidation' do
    it 'should be a class' do
      expect(DataValidations::CnpjValidation).to be_a(Class)
    end
  end
  
  context 'Testing if the module validations_module have a method validate_with_validator' do
    it 'should be a method' do
      expect(DataValidations::CpfValidation.method(:validate_with_validator)).to be_a(Method)
    end
  end
  
  context 'Testing if the module validations_module have a method validate_cpf' do
    it 'should be a method' do
      expect(DataValidations::CpfValidation.method(:validate_cpf)).to be_a(Method)
    end
  end
  
  context 'Testing if the module validations_module have a method validate_cnpj' do
    it 'should be a method' do
      expect(DataValidations::CnpjValidation.method(:validate_cnpj)).to be_a(Method)
    end
  end
end

describe DataValidations do
  context 'Testing if the method validate_cpf return an cpf formatted if the validation is valid' do
    it 'should be a cpf formatted' do
      cpf = CPF.generate(true)
      expect(DataValidations::CpfValidation.validate_cpf(cpf)).to eq(cpf)
    end
  end
end

describe DataValidations do
  context 'Testing if the method validate_cpf raise an ArgumentError if the validation is invalid' do
    it 'should be an ArgumentError' do
      cpf = CPF.generate(false)
      expect { DataValidations::CpfValidation.validate_cpf(cpf) }.to raise_error(ArgumentError)
    end
  end
end

describe DataValidations do
  context 'Testing if the method validate_cnpj return an cnpj formatted if the validation is valid' do
    it 'should be a cnpj formatted' do
      cnpj = CNPJ.generate(true)
      expect(DataValidations::CnpjValidation.validate_cnpj(cnpj)).to eq(cnpj)
    end
  end
end

describe DataValidations do
  context 'Testing if the method validate_cnpj raise an ArgumentError if the validation is invalid' do
    it 'should be an ArgumentError' do
      cnpj = CNPJ.generate(false)
      expect { DataValidations::CnpjValidation.validate_cnpj(cnpj) }.to raise_error(ArgumentError)
    end
  end
end
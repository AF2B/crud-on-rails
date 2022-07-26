module DataValidations
  class CpfValidation < ActiveModel::Validator
    def self.validate_with_validator(record)
      unless record.cpf.blank?
        unless record.cpf.length == 11
          record.errors[:cpf] << 'CPF must be 11 digits'
        end
        unless record.cpf.match(/^\d{3}\.\d{3}\.\d{3}-\d{2}$/)
          record.errors[:cpf] << 'CPF must be in the format xxx.xxx.xxx-xx'
        end
      end
    end

    def self.validate_cpf(cpf)
      cpf_stripped = CPF.stripped(cpf)
      cpf_valid = CPF.valid?(cpf_stripped)
      
      if cpf_valid
        CPF.formatted(cpf_valid)
      else
        raise ArgumentError, 'O CPF é inválido!'
      end
    end
  end

  class CnpjValidation < ActiveModel::Validator
    def self.validate_cnpj(cnpj)
      # TODO
    end
  end
end
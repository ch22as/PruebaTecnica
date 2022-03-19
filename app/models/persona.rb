class Persona < ApplicationRecord
  has_many :comunicados, dependent: :destroy
  
  def is_legal_age?
    ((self.fecha_nacimiento + 18.years) > Date.today)? true : false
  end
end

class Persona < ApplicationRecord
  # has_many :comunicados, polymorphic: true, dependent: :destroy
  has_many :comunicados, foreign_key: :creator_id
  has_many :comunicados, foreign_key: :receptor_id

  scope :legal_age, -> {where("fecha_nacimiento < ?", (Date.today-18.years))}



  


end

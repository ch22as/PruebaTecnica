class Comunicado < ApplicationRecord

  belongs_to :personas,:foreign_key => "creador_id"
  has_many  :adjuntos

end

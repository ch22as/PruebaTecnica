json.extract! comunicado, :id, :creador_id, :receptor_id, :asunto, :contenido, :comunicado_anterior_id, :created_at, :updated_at
json.url comunicado_url(comunicado, format: :json)

json.extract! persona, :id, :nombre, :fecha_nacimiento, :created_at, :updated_at
json.url persona_url(persona, format: :json)

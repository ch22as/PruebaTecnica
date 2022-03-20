class ComunicadosController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_comunicado, only: %i[ show edit update destroy ]

  def releases_legal_age_people_with_attachments_number
    res = {}

    Persona.legal_age.each_with_index do |person, index|
      if person.comunicados.present?
        hash = {}
        hash[:person] = person.nombre
        hash[:releases] = []
        
        person.comunicados.each do |release|
          hash2= {}
          hash2[:release] = release
          hash2[:attachments_number] = release.adjuntos.count rescue 0
          
          hash[:releases] << hash2 
      
        end
        res[index] = hash
      end

    end

    render json:{ resp: res}
  end



  # GET /comunicados or /comunicados.json
  def index
    @comunicados = Comunicado.all
  end

  # GET /comunicados/1 or /comunicados/1.json
  def show
  end

  # GET /comunicados/new
  def new
    @comunicado = Comunicado.new
  end

  # GET /comunicados/1/edit
  def edit
  end

  # POST /comunicados or /comunicados.json
  def create
    @comunicado = Comunicado.new(comunicado_params)

    respond_to do |format|
      if @comunicado.save
        format.html { redirect_to comunicado_url(@comunicado), notice: "Comunicado was successfully created." }
        format.json { render :show, status: :created, location: @comunicado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comunicado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comunicados/1 or /comunicados/1.json
  def update
    respond_to do |format|
      if @comunicado.update(comunicado_params)
        format.html { redirect_to comunicado_url(@comunicado), notice: "Comunicado was successfully updated." }
        format.json { render :show, status: :ok, location: @comunicado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comunicado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comunicados/1 or /comunicados/1.json
  def destroy
    @comunicado.destroy

    respond_to do |format|
      format.html { redirect_to comunicados_url, notice: "Comunicado was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comunicado
      @comunicado = Comunicado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comunicado_params
      params.require(:comunicado).permit(:creador_id, :receptor_id, :asunto, :contenido, :comunicado_anterior_id)
    end
end

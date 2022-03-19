class AdjuntosController < ApplicationController
  before_action :set_adjunto, only: %i[ show edit update destroy ]

  # GET /adjuntos or /adjuntos.json
  def index
    @adjuntos = Adjunto.all
  end

  # GET /adjuntos/1 or /adjuntos/1.json
  def show
  end

  # GET /adjuntos/new
  def new
    @adjunto = Adjunto.new
  end

  # GET /adjuntos/1/edit
  def edit
  end

  # POST /adjuntos or /adjuntos.json
  def create
    @adjunto = Adjunto.new(adjunto_params)

    respond_to do |format|
      if @adjunto.save
        format.html { redirect_to adjunto_url(@adjunto), notice: "Adjunto was successfully created." }
        format.json { render :show, status: :created, location: @adjunto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @adjunto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adjuntos/1 or /adjuntos/1.json
  def update
    respond_to do |format|
      if @adjunto.update(adjunto_params)
        format.html { redirect_to adjunto_url(@adjunto), notice: "Adjunto was successfully updated." }
        format.json { render :show, status: :ok, location: @adjunto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @adjunto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adjuntos/1 or /adjuntos/1.json
  def destroy
    @adjunto.destroy

    respond_to do |format|
      format.html { redirect_to adjuntos_url, notice: "Adjunto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adjunto
      @adjunto = Adjunto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adjunto_params
      params.fetch(:adjunto, {})
    end
end

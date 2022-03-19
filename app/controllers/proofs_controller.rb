class ProofsController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  before_action :check_number, only: [:first_exercise, :second_exercise]
  before_action :check_array, only: [:second_exercise]


  def index
    render json: :ok
  end

  def first_exercise
    
    response = Proof::factor_sum(@number)

    render json:{result: response }
    
  end

  def second_exercise

    response = Proof::array_divide(@array, @number)

    render json:{result: response}
  end


  private

    def check_number
      @number = params["number"]
      @number = params["divisor"] if @number.blank?

      if @number.blank? || !@number.is_a?(Integer) || @number < 0
        _word = (params["action"]== "second_exercise")? "divisor" : "número"
        render json:{error: 
          "Es necesario enviar un #{_word}  entero y mayor de cero"
        }
        
        return
      end  
    end


    def check_array
       @array = params[:array]

      if @array.class.to_s != "Array"
        render json:{error: "Es necesario un array" }
        return
      end

      
    end

end

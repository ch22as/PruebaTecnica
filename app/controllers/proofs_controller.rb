class ProofsController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  before_action :check_number, only: [:first_exercise, :second_exercise]
  before_action :check_array, only: [:second_exercise]


  def index
    render json: {
      first_proof: "http://localhost:3000/proofs/first_exercise?number=11",
      second_proof: "http://localhost:3000/proofs/second_exercise?divisor=3&array=[1,2,3,4,5]",
      third_proof: 
        "http://localhost:3000/comunicados/releases_legal_age_people_with_attachments_number",
    }
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
      if params["action"] == "first_exercise"
        @number = params["number"].to_i
        _word = "número"
        
      elsif params["action"] == "second_exercise" 
        @number = params["divisor"].to_i
        _word = "divisor"
      else
        @number = nil
      end
      
      if @number.blank? || !@number.is_a?(Integer) || @number < 0
        render json:{error: 
        "Es necesario enviar un #{_word}  entero y mayor de cero"
      }
        
        return
      end 

    end


    def check_array
       @array = params[:array].remove("[").remove("]").split(",")

      if @array.class.to_s != "Array"
        render json:{error: "Es necesario un array" }
        return
      end

      
    end

end

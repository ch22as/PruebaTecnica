class Proof < ApplicationRecord
  
  def self.factor_sum(number)
    res = 0
    other = nil

    res = (0..number).reduce(:+)

    other = Proof::factor_sum(number - 1) if number > 0
      
    res += other if other.present? && other > 0
  
    return res 
  end 

  def self.array_divide(array, divisor)
    result = []
    number = 0
    
    divisor.times{ result << [] }
      

    (0...(array.length-1)).each do |pp|
      (0...(divisor)).each do |p|
        if number <= array.length
          result[p]<< array[number] 
          number += 1
        end
      end
    end
    
    while result[result.length-2].length > result[result.length-1].length 
      result[result.length-1] << nil
    end


    return [result]
  end
end

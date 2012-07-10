class CreditCard
  attr_reader :number, :type
  
  def initialize(number)
    @number = number
    @num_array = @number.to_s.scan(/\d/).map { |x| x.to_i }
    @type = "INVALID"
    set_type
  end
  
  private
  
  def set_type
    case @num_array.length
      when 13
        validate_visa
      when 15
        validate_amex
      when 16
        validate_visa
        validate_discover
        validate_mastercard        
    end
  end
  
  def validate_amex
    validation_numbers = @num_array[0..1]
    if validation_numbers == [3, 4] || validation_numbers == [3, 7]
      @type = "AMEX" 
    end
  end
  
  def validate_discover
    validation_numbers = @num_array[0..3]
    @type = "Discover" if validation_numbers == [6,0,1,1]
  end
  
  def validate_mastercard
    validation_numbers = @num_array[0..1]
    if validation_numbers == [5, 1] || validation_numbers == [5, 5]
      @type = "MasterCard"
    end
  end

  def validate_visa
    validation_number = @num_array[0]
    @type = "Visa" if validation_number == 4
  end
end
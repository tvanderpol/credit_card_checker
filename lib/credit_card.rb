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
        @type = "Visa" if validate_type(@num_array[0], [4])
      when 15
        @type = "AMEX" if validate_type(@num_array[0..1], [[3, 4], [3, 7]])
      when 16
        @type = "Visa" if validate_type(@num_array[0], [4])
        @type = "Discover" if validate_type(@num_array[0..3], [[6,0,1,1]])
        @type = "MasterCard" if validate_type(@num_array[0..1], [[5, 1], [5, 5]])
    end
  end
  
  def validate_type(needle, haystack)
    match = false
    haystack.each do |number|
      match = true if number == needle
    end
    return match
  end
end
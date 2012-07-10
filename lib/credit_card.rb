class CreditCard
  attr_reader :number, :type
  
  def initialize(number)
    @number = number.to_s.gsub(/\s+/, "").to_i
    @num_array = @number.to_s.scan(/\d/).map { |x| x.to_i }
    @type = "Unknown"
    @valid = false
    set_type
    validate_luhn
  end
  
  def valid?
    @luhn && @type != "Unknown"
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
  
  def validate_luhn
    # Double every odd number on reversed array:
    to_sum = @num_array.reverse.each_with_index.map do |val, key|
      key % 2 != 0 ? val  * 2 : val
    end
    # Make sure no double digit numbers exist in array, as we have to sum each digit:
    to_sum = to_sum.to_s.scan(/\d/).map { |x| x.to_i }
    # valid if sum is multiple of 10:
    @luhn = to_sum.inject(:+) % 10 == 0
  end
end
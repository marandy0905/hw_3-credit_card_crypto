module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    no_check = nums_a[0..-2]
    no_check.reverse!.map!.with_index { |value, i| i.even? ? value * 2 : value }
    no_check.map! { |value| value >= 10 ? value.digits.sum : value }
    (no_check.sum * 9).digits[0] == nums_a[-1]
  end
end

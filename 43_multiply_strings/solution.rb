def multiply(num1, num2)
  if num1 == "0" || num2 == "0"
    return "0"
  end

  digits_of_num1 = num1.bytes.map { |byte| byte - 48 }
  digits_of_num2 = num2.bytes.map { |byte| byte - 48 }

  digits_of_num1.reverse!
  digits_of_num2.reverse!

  final_result_array = []
  digits_of_num2.each_with_index do |digit_num2, index|
    puts "digit of multiplier #{digit_num2}"
    result_array = []
    carray = 0
    digits_of_num1.each do |digit_num1|
      result = digit_num1 * digit_num2 + carray
      carray = result / 10
      result_array.push(result % 10)
    end
    if carray > 0
      result_array.push carray
    end
    index.times { result_array.unshift(0) }

    carray = 0
    result_array.each_with_index do |digit, index|
      result = 0
      if final_result_array[index]
        result = digit + final_result_array[index] + carray
      else
        result = digit + carray
      end
      final_result_array[index] = result % 10
      carray = result / 10
    end
    if carray > 0
      final_result_array.push carray
    end
  end
  final_result_array.reverse.join("")
end

p multiply("9133", "0")

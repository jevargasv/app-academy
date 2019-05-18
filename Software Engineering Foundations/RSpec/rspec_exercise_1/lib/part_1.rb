def average(num1, num2)
  (num1 + num2) / 2.0
end

def average_array(arr)
  arr.reduce { |acc, num| num + acc } / arr.length.to_f
end

def repeat(str, num)
  str * num
end

def yell(str)
  "#{str.upcase}!"
end

def alternating_case(str)
  alternating = str.split.each_with_index.map do |word, idx|
    idx % 2 == 0 ? word.upcase : word.downcase
  end

  alternating.join(" ")
end
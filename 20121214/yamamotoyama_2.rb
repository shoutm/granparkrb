
module Yamamotoyama_2
  def self.make_kaibun(input)
    if kaibun?(input)
      return input
    end

    postfix = ""
    1.upto(input.length) do |i|
      postfix = input[i - 1] + postfix 
      if Yamamotoyama_2.kaibun?(input + postfix)
        return input + postfix 
      end
    end
  end

  def self.kaibun?(input)
    1.upto((input.length / 2.0).floor) do |i|
      if input[i - 1] != input[-1 * i]
        return false
      end
     end
  
    return true
  end
end

input = STDIN.gets.chomp

print Yamamotoyama_2.make_kaibun(input) + "\n"

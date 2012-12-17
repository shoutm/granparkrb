module Yamamotoyama
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
if Yamamotoyama.kaibun? input 
  print "Yes\n"
else
  print "No\n"
end


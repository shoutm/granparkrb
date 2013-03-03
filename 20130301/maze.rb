def is_on_or_above(y, yy)
  case y - yy 
  when 0
    return :on
  when 1
    return :above
  end

  return :other
end

def main(x,y)
  0.upto(y).each do |yy|
    if yy == 0 
      print "#<"
      (x-2).times { print "." }
    else
      case yy % 4 
      when 0
        case is_on_or_above(y, yy)
        when :on
          (x-2).times { print "." }
          print ">#"
        when :above
          (x-1).times { print "." }
          print "#\n"
          (x-2).times { print "#" }
          print ">#\n"
          break
        else 
          x.times { print "." }
        end
      when 1
        (x-1).times { print "#" }
        print "."
      when 2
        case is_on_or_above(y, yy)
        when :on
          (x-2).times { print "#" }
          print ">."
        when :above
          (x-2).times { print "#" }
          print "..\n"
          (x-2).times { print "#" }
          print ">#\n"
          break
        else 
          x.times { print "." }
        end
      else 
        print "."
        (x-1).times { print "#" }
      end
    end

    print "\n"
  end
end


main ARGV[0].to_i ,ARGV[1].to_i

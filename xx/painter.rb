require "rspec"
require "active_support/all"

class Painter
  attr_accessor :cellmap

  def initialize(cellmap)
    @cellmap = cellmap
    @size = cellmap.size # size x and size y are expected equal.
  end

  def get_max_brush_size
    brush_size = 99999 # put a number as much as big
    0.upto(@size - 1) do |x|
      0.upto(@size - 1) do |y|
        tmp = get_largest_area(x, y)
        brush_size = tmp if tmp < brush_size
      end
    end

    brush_size
  end

  # get largest area investigating cellmap from (x, y) to (x + n, y + n)
  # "n" is 0 or a natural number.
  # If cellmap(x, y) is not 0, return 0
  def get_largest_area(x, y)
    return 0 if @cellmap[x][y] != 0
    n = 0
    max_n = get_max_n(x, y)
    catch :exit do 
      n.upto(max_n) do
        0.upto(n) do |i| throw :exit if @cellmap[x + n][y + i] != 0 end
        0.upto(n) do |j| throw :exit if @cellmap[x + j][y + n] != 0 end
        n += 1
      end 
    end

    return n 
  end
  
  # return maximum n value if it starts counting from (x, y) to (x + n, y + n)
  def get_max_n(x, y)
    @size - [x, y].max - 1
  end
end

def main
  firstline = STDIN.gets.chomp
  size = firstline.chomp.split(' ').size

  # This is a 2-dimension array to store input values
  cellmap = Array.new
  # put first row to cellmap 
  cellmap << firstline.split(' ')

  # read other input values from standard input 
  (size - 1).times do |count|
    cellmap << STDIN.gets.chomp.split(' ')
  end

  p cellmap
end

main

describe Painter do 
  it "should initialize" do 
    cellmap = [[1,2,3],[4,5,6],[7,8,9]]
    cellmap2 = [[1,2,3],[4,5,6],[7,8,9]]
    p = Painter.new(cellmap)
    p.cellmap.should == cellmap2
  end

  it "should get max brush size" do 
    cellmap1 = [[0,0,0,0,0,0],
                [0,0,0,0,0,0],
                [0,0,1,1,0,0],
                [0,0,1,1,0,0],
                [0,0,0,0,0,0],
                [0,0,0,0,0,0]]
    cellmap2 = [[0,0,0,0,0],
                [0,1,0,1,0],
                [0,0,1,0,0],
                [0,1,0,1,0],
                [0,0,0,0,0]]
    cellmap3 = [[0,0,0,0,0,0],
                [0,0,0,0,0,0],
                [0,0,0,0,0,0],
                [0,0,0,0,0,0],
                [0,0,0,0,0,0],
                [0,0,0,0,0,0]]
    cellmap4 = [[0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0],
                [0,0,0,0,1,1,1],
                [0,0,0,1,0,0,0],
                [0,0,0,1,0,0,0],
                [0,0,0,1,0,0,0]]
    cellmap5 = [[0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0],
                [0,0,0,0,1,1,1],
                [0,0,0,1,0,0,0],
                [0,0,0,1,0,0,0],
                [0,0,0,0,0,0,0]]
    Painter.new(cellmap1).get_max_brush_size.should == 2
    Painter.new(cellmap2).get_max_brush_size.should == 1
    Painter.new(cellmap3).get_max_brush_size.should == 6
    Painter.new(cellmap4).get_max_brush_size.should == 3
    Painter.new(cellmap5).get_max_brush_size.should == 1
  end

  it "should get largest area" do 
    cellmap1 = [[0,0,0,0,0,0],
                [0,0,0,0,0,0],
                [0,0,1,1,0,0],
                [0,0,1,1,0,0],
                [0,0,0,0,0,0],
                [0,0,0,0,0,0]]
    p = Painter.new(cellmap1)
    p.get_largest_area(0, 0).should == 2
    p.get_largest_area(1, 0).should == 2
    p.get_largest_area(1, 1).should == 1
    p.get_largest_area(2, 2).should == 0
    p.get_largest_area(3, 1).should == 1
    p.get_largest_area(3, 0).should == 2
    p.get_largest_area(1, 3).should == 1
    p.get_largest_area(4, 4).should == 2
  end

 it "should get max n" do 
    cellmap1 = [[0,0,0,0,0,0],
                [0,0,0,0,0,0],
                [0,0,1,1,0,0],
                [0,0,1,1,0,0],
                [0,0,0,0,0,0],
                [0,0,0,0,0,0]]
    p = Painter.new(cellmap1)
    p.get_max_n(0,0).should == 5
    p.get_max_n(1,1).should == 4
    p.get_max_n(3,2).should == 2
    p.get_max_n(2,3).should == 2
    p.get_max_n(5,5).should == 0
 end
end

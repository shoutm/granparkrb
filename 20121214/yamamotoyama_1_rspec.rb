require "rspec"
require "./yamamotoyama_1"


describe "Yamamotoyama_1" do 
  it do 
    Yamamotoyama.kaibun?("lol").should be_true
    Yamamotoyama.kaibun?("abc").should be_false
    Yamamotoyama.kaibun?("Aba").should be_false
    Yamamotoyama.kaibun?("ccccc").should be_true
    Yamamotoyama.kaibun?("cccc").should be_true
  end
end


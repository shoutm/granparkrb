require "rspec"
require "./yamamotoyama_2"


describe "yamamotoyama2" do 
  it do
    Yamamotoyama_2.make_kaibun("lol").should == "lol"
    Yamamotoyama_2.make_kaibun("horor").should == "hororoh"
    Yamamotoyama_2.make_kaibun("Abc").should == "AbcbA"
  end
end

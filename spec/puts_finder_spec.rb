require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "PutsFinder" do
  describe "Turned on" do
    it "should raise and error" do
      PutsFinder.state = :on
      lambda { puts "lolz" }.should raise_error(Exception)
    end
  end

  describe "Turned off" do
    before do
      PutsFinder.state = :off
      @output = StringIO.new
      $stdout = @output
    end

    it "should just puts" do
      puts "lolz2"
      @output.string.should match(/lolz2/)
    end
  end
end

require File.join(File.dirname(__FILE__), %w[spec_helper])

describe "Date Extension" do
  
  describe "Checking a Date for weekday status" do
    
    it "should know that Mon-Fri are weekdays" do
      (1...5).each do |i|
        Date.new(2000, 1, (3 + i)).weekday?.should be_true
      end
    end
    
    it "should know that Sunday is not a weekday" do
      Date.new(2000, 1, 2).weekday?.should be_false
    end
    
    it "should know that Saturday is not a weekday" do
      Date.new(2000, 1, 1).weekday?.should be_false
    end
    
  end
  
  describe "Calculating weekdays between Dates" do
    it "should return 2086" do
      Date.new(2000, 1, 1).weekdays_until(Date.new(2008, 1, 1)).should == 2086
    end
  end
  
end

describe "Time Extension" do
  
  describe "Checking a Time for weekday status" do
    
    it "should know that Mon-Fri are weekdays" do
      (1...5).each do |i|
        Date.new(2000, 1, (3 + i)).beginning_of_day.weekday?.should be_true
      end
    end
    
    it "should know that Sunday is not a weekday" do
      Date.new(2000, 1, 2).beginning_of_day.weekday?.should be_false
    end
    
    it "should know that Saturday is not a weekday" do
      Date.new(2000, 1, 1).beginning_of_day.weekday?.should be_false
    end
    
  end
  
  describe "Calculating weekdays between Times" do
    it "should return 521" do
      Date.new(2000, 1, 1).beginning_of_day.weekdays_until(Date.new(2002, 1, 1)).should == 521
    end
  end
  
end

describe "DateTime Extension" do
  
  describe "Checking a DateTime for weekday status" do
    
    it "should know that Mon-Fri are weekdays" do
      (1...5).each do |i|
        DateTime.new(2000, 1, (3 + i), 1, 1, 1).weekday?.should be_true
      end
    end
    
    it "should know that Sunday is not a weekday" do
      DateTime.new(2000, 1, 2, 1, 1, 1).weekday?.should be_false
    end
    
    it "should know that Saturday is not a weekday" do
      DateTime.new(2000, 1, 1, 1, 1, 1).weekday?.should be_false
    end
    
  end
  
end

describe "Numeric::Time Extension" do
  
  describe "#weekdays_from" do
    it "should return 5" do
      5.weekdays_from(Date.new(2000, 1, 1).beginning_of_day).should == Date.new(2000, 1, 7).beginning_of_day
    end
  end

  describe "#weekdays_from_now" do
    it "should return 5" do
      Time.stub!(:now => Date.new(2000, 1, 1).beginning_of_day)
      5.weekdays_from_now.should == Date.new(2000, 1, 7).beginning_of_day
    end
    
    it "should be able to handle zero cases" do
      Time.stub!(:now => Date.new(2000, 1, 1).beginning_of_day)
      0.weekdays_from_now.should == Date.new(2000, 1, 1).beginning_of_day
    end

    it "should be able to handle negative spans" do
      Time.stub!(:now => Date.new(2000, 1, 1).beginning_of_day)
      -5.weekdays_from_now.should == Date.new(1999, 12, 27).beginning_of_day
    end
    
  end


  describe "#weekdays_ago" do
    it "should return 5" do
      Time.stub!(:now => Date.new(2000, 1, 1).beginning_of_day)
      5.weekdays_ago.should == Date.new(1999, 12, 27).beginning_of_day
      5.weekdays_ago(Date.new(1999, 12, 27).beginning_of_day).should == Date.new(1999, 12, 20).beginning_of_day
    end
    
    it "should handle zero spans" do
      Time.stub!(:now => Date.new(2000, 1, 1).beginning_of_day)
      0.weekdays_ago.should == Date.new(2000, 1, 1).beginning_of_day
    end

    it "should handle negative spans" do
      Time.stub!(:now => Date.new(2000, 1, 1).beginning_of_day)
      -5.weekdays_ago.should == Date.new(2000, 1, 7).beginning_of_day
    end
    
  end

end
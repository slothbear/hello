require File.join(File.dirname(__FILE__), "helper")

describe "random" do
  before { @hello = Hello.random }

  it "should not be blank" do
    @hello.should_not be_blank
  end

  it "should be a hello from agnostic" do
    File.hello_data("agnostic").include? @hello
  end

  %w(male female morning afternoon evening).each do |kind|
    it "should not be a hello from #{kind}" do
      ! File.hello_data(kind).include? @hello
    end
  end
end

describe "random with male gender" do
  before { @hello = Hello.random(:gender => :male) }

  it "should not be blank" do
    @hello.should_not be_blank
  end

  it "should be a hello from male or agnostic" do
    hellos = File.hello_data("male") & File.hello_data("agnostic")
    hellos.include? @hello
  end

  %w(female morning afternoon evening).each do |kind|
    it "should not be a hello from #{kind}" do
      ! File.hello_data(kind).include? @hello
    end
  end
end

describe "random with female gender" do
  before { @hello = Hello.random(:gender => :female) }

  it "should not be blank" do
    @hello.should_not be_blank
  end

  it "should be a hello from female or agnostic" do
    hellos = File.hello_data("female") & File.hello_data("agnostic")
    hellos.include? @hello
  end

  %w(male morning afternoon evening).each do |kind|
    it "should not be a hello from #{kind}" do
      ! File.hello_data(kind).include? @hello
    end
  end
end

describe "random with morning time" do
  before { @hello = Hello.random(:time => :morning) }

  it "should not be blank" do
    @hello.should_not be_blank
  end

  it "should be a hello from morning or agnostic" do
    hellos = File.hello_data("morning") & File.hello_data("agnostic")
    hellos.include? @hello
  end

  %w(male female afternoon evening).each do |kind|
    it "should not be a hello from #{kind}" do
      ! File.hello_data(kind).include? @hello
    end
  end
end

describe "random with afternoon time" do
  before { @hello = Hello.random(:time => :afternoon) }

  it "should not be blank" do
    @hello.should_not be_blank
  end

  it "should be a hello from afternoon or agnostic" do
    hellos = File.hello_data("afternoon") & File.hello_data("agnostic")
    hellos.include? @hello
  end

  %w(male female morning evening).each do |kind|
    it "should not be a hello from #{kind}" do
      ! File.hello_data(kind).include? @hello
    end
  end
end

describe "random with evening time" do
  before { @hello = Hello.random(:time => :evening) }

  it "should not be blank" do
    @hello.should_not be_blank
  end

  it "should be a hello from evening or agnostic" do
    hellos = File.hello_data("evening") & File.hello_data("agnostic")
    hellos.include? @hello
  end

  %w(male female morning afternoon).each do |kind|
    it "should not be a hello from #{kind}" do
      ! File.hello_data(kind).include? @hello
    end
  end
end

describe "an invalid option" do
  it "should provide feedback for invalid option" do
    lambda { Hello.random(:does_not => :exist) }.should raise_error
  end
end

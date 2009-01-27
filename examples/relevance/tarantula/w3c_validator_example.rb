require File.join(File.dirname(__FILE__), "..", "..", "example_helper.rb")
require File.join(File.dirname(__FILE__),'..','..','..','lib','relevance','tarantula','w3c_validator.rb')

if defined?(W3CValidators)
  include Relevance::Tarantula
  describe "Relevance::Tarantula::W3CValidator default" do
    before do
      @handler = Relevance::Tarantula::W3CValidator.new
    end

    it "likes a good document" do
      response = stub(:html? => true, :body => <<-BODY, :code => 200)
<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 3.2//EN\">
<html>
  <title></title>
  <body></body>
</html>
BODY
      @handler.handle(Result.new(:response => response)).should == nil
    end

    it "rejects a document with errors" do
      response = stub(:html? => true, :body => "<hotml>", :code => 200)
      result = @handler.handle(Result.new(:response => response))
      result.should_not be_nil
      result.data.should =~ /no document type declaration/
      result.description.should == "Bad HTML (W3C Validator)"
    end

    it "accepts a document with warnings" do
      response = stub(:html? => true, :body => <<-BODY, :code => 200)
<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\">
<html>
  <title></title>
  <body>
    <div>
      <label for='foo'>bar</label>
    </div>
  </body>
</html>
BODY
      result = @handler.handle(Result.new(:response => response))
      result.should be_nil
    end
  end

  describe "Relevance::Tarantula::W3CValidator with :show_warnings => true" do
    before do
      @handler = Relevance::Tarantula::W3CValidator.new(:show_warnings => true)
    end

    it "rejects a document with warnings with :show_warnings=>true" do
      response = stub(:html? => true, :body => <<-BODY, :code => 200)
<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\">
<html>
  <title></title>
  <body>
    <div>
      <label for='foo'>bar</label>
    </div>
  </body>
</html>
BODY
      result = @handler.handle(Result.new(:response => response))
      result.should_not be_nil
      result.data.should =~ /reference to non-existent ID/
    end
  end
else
  $stderr.puts "W3CValidators not loaded. Test will not run."
end

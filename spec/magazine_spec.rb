describe Magazine do
  let(:time) { Magazine.new("Time") }
  let(:people) { Magazine.new("People") }
  let(:how_to_guide) { Article.new("How To Guide", "Hello, World!") }

  describe "#new" do
    it "initializes with a name variable" do
      expect(time.name).to eq("Time")
    end

    it "creates an empty array of articles" do
      expect(time.articles.count).to eq(0)
    end

    it "pushes in self to magazines class variable" do
      Magazine.all.clear # How does this work without a setter?
      time
      people
      expect(Magazine.all.count).to eq(2)
    end

  end

  describe "#articles=" do

    it "updates articles instance variable" do
      time.articles = how_to_guide
      expect(time.articles).to include(how_to_guide)
    end

  end

  describe ".magazine_articles" do

    it "should include article" do
      Magazine.all.clear # How does this work without a setter?
      time
      time.articles = how_to_guide
      expect(Magazine.magazine_articles("Time")).to include(how_to_guide)
    end

  end

end

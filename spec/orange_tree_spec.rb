require_relative "../orange"
require_relative "../orange_tree"


describe OrangeTree do
  let(:tree) { OrangeTree.new }

  #You'll need to switch `pending` to `describe` when you're ready
  # to implement each set of tests.

  describe "#age" do
    it "has an age" do
      expect(tree.age).to be(0)
    end
  end

  describe "#height" do
    it "has a height" do
      expect(tree.height).to be(0)
    end
  end

  describe "#grow" do
    context 'tree is zero height' do
      it 'should return 2.5' do
        expect(tree.grow).to eq(2.5)
      end
    end

    context 'tree has 25 height' do
      it 'should return 0' do
        tree.height = 25
        expect(tree.grow).to eq(0)
      end
    end

    context 'tree has 24 height' do
      it 'should return 0' do
        tree.height = 24
        expect(tree.grow).to eq(1)
      end
    end
  end


  describe "#pass_growing_season" do
    it "should change the age" do
      # This should be more explicit. How much should the tree age by?
      # https://www.relishapp.com/rspec/rspec-expectations/v/2-0/docs/matchers/expect-change
      expect {tree.pass_growing_season}.to change {tree.age}
    end

    it "should make the tree grow" do
      #This should be more explicit. How much should the tree grow?
      expect {tree.pass_growing_season}.to change{tree.height}
    end

    context "the tree is old enough to bear fruit" do
      it "should cause the tree to produce oranges" do
        tree = OrangeTree.new(age: 6)
        expect(tree.pass_growing_season).to be_between(100, 300)
      end
    end
  end

  describe "#mature?" do
    it "returns true if tree is old enough to bear fruit" do
      tree = OrangeTree.new(age: 6)
      expect(tree.mature?).to be_truthy
    end

    it "returns false if tree is not old enough to bear fruit" do
      expect(tree.mature?).to be_falsey
    end
  end

  describe "#dead?" do
    it "should return false for an alive tree" do
      expect(tree.dead?).to be(false)
    end

    it "should return true for a dead tree" do
      expect(OrangeTree.new(age: 100).dead?).to be(true)
    end
  end

  describe '#has_oranges?' do
    it 'should return true if oranges are on the tree' do
      tree.age = 6
      tree.pass_growing_season
      expect(tree.has_oranges?).to eq(true)
    end

    it "should return false if the tree has no oranges" do
      expect(tree.has_oranges?).to eq(false)
    end
  end

  describe "#pick_an_orange" do
    let(:tree) { OrangeTree.new(age: 6) }

    before do
      tree.pass_growing_season
    end

    it "should return an orange from the tree" do
      expect(tree.pick_an_orange).to be_a(Orange)
    end

    it "the returned orange should no longer be on the tree" do
      expected = tree.pick_an_orange
      expect(tree.oranges.include?(expected)).to be(false)
    end

    it "should raise an error if the tree has no oranges" do
      tree2 = OrangeTree.new
      expect(tree2.pick_an_orange).to raise_error
    end
  end
end

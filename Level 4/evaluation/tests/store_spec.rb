require_relative '../store'

describe Product do
  subject { Product.new('Product', 15.99) }

  context 'creating' do
    it { is_expected.to have_attributes(name: 'Product') }
    it { is_expected.to have_attributes(price: 15.99) }
  end

  context 'is created' do
    it "and prints it's type, name and price" do
      expect(subject.to_s).to eql 'Product - Product - $15.99'
    end
  end

  context 'gets a' do
    it 'valid discount (10%)' do
      expect(subject.discount(0.10)).to eql subject.price - (subject.price * 0.10)
    end

    it 'invalid discount (200%)' do
      expect(subject.discount(2)).to_not eql subject.price - (subject.price * 2)
    end

    it 'full discount (100%)' do
      expect(subject.discount(1)).to eql subject.price - (subject.price * 1)
    end
  end
end

describe Book do
  subject { Book.new(name, price, category) }

  context 'creating' do
    let(:name) { 'Adventure Book' }
    let(:price) { 15.99 }
    let(:category) { :adventure }

    it { is_expected.to have_attributes(name: 'Adventure Book') }
    it { is_expected.to have_attributes(price: 15.99) }
    it { is_expected.to have_attributes(category: :adventure) }
  end

  context 'is created' do
    let(:name) { 'Adventure Book' }
    let(:price) { 15.99 }
    let(:category) { :adventure }

    it "and prints it's type, name, price and category" do
      expect(subject.to_s).to eql 'Book - Adventure Book - $15.99 - adventure'
    end

    it "and its category doesn't have a default value" do
      expect(subject).to have_attributes(category: :adventure)
    end

    it 'with a non-existing category' do
      book = Book.new('Learning Ruby', 20.00, 'Awesome')
      expect(book.category).to_not eq 'Awesome'
    end

    it 'and gets a default category' do
      book = Book.new('Learning Ruby', 20.00, 'Awesome')
      expect(book.category).to eq :scifi
    end
  end
end

describe Game do
  subject { Game.new(name, price, platform) }

  context 'creating' do
    let(:name) { 'Tetris' }
    let(:price) { 59.99 }
    let(:platform) { :ps4 }

    it { is_expected.to have_attributes(name: 'Tetris') }
    it { is_expected.to have_attributes(price: 59.99) }
    it { is_expected.to have_attributes(platform: :ps4) }
  end

  context 'is created' do
    let(:name) { 'Tetris' }
    let(:price) { 59.99 }
    let(:platform) { :ps4 }

    it "and prints it's type, name, price and platform" do
      expect(subject.to_s).to eql 'Game - Tetris - $59.99 - ps4'
    end

    it "and its platform doesn't have a default value" do
      expect(subject).to have_attributes(platform: :ps4)
    end

    it 'with a non-existing platform' do
      game = Game.new('Super Mario Odyssey', 20.00, :switch)
      expect(game.platform).to_not eq :switch
    end

    it 'and gets a default platform' do
      game = Game.new('Super Mario Odyssey', 20.00, :switch)
      expect(game.platform).to eq :pc
    end
  end
end

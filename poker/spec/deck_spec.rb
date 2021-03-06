require 'rspec'
require 'deck'

describe Deck do
  let (:deck) {Deck.new}

  describe "#initialize" do

    it "should contain 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    it "should contain no duplicate cards" do
      expect(deck.cards.length).to eq(deck.cards.uniq.length)
    end

    it "should contain correct amounts of cards of a suit" do
      SUITS = [:♠, :♥, :♦, :♣]
      VALUES = [:A, :K, :Q, :J, 10, 9, 8, 7, 6, 5, 4, 3, 2]

      expect(deck.include?(VALUES[rand(VALUES.size)],
       SUITS[rand(SUITS.size)])).to be true
    end
  end

  describe "#shuffle!" do
    it "should shuffle cards" do
      cards_dup = deck.cards.dup
      deck.shuffle!
      expect(deck.cards).not_to eq(cards_dup)
    end
  end

  describe "#draw!" do

    it "should reduce deck size by 1" do
      deck.draw!
      expect(deck.cards.length).to eq(51)
    end

    it "should remove the card from the deck" do
      last_card = deck.cards.last
      deck.draw!
      expect(deck.cards).not_to include(last_card)
    end

    it "returns the card on top of the deck" do
      last_card = deck.cards.last
      expect(deck.draw!).to eq(last_card)
    end

  end
end

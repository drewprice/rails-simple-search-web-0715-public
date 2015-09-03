require 'rails_helper'

RSpec.describe Search, :type => :model do
  context '#for' do
    before do
      @panda = Word.create(name: "panda")
      @llama = Word.create(name: "llama")
      @iguana = Word.create(name: "iguana")
    end

    it 'returns results in an array' do
      search = Search.new("ll")
      expect(search.fuzzy).to eq([@llama])
    end

    it 'can return multiple results' do
      search = Search.new("an")
      expect(search.fuzzy).to include(@iguana && @panda)
    end

    it 'returns an empty array if it finds nothing' do
      search = Search.new("x")
      expect(search.fuzzy).to eq([])
    end
  end
end

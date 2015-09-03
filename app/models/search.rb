class Search
  attr_reader :keyword

  def initialize(keyword)
    @keyword = keyword
  end

  def exact
    Word.find_by(name: keyword)
  end

  def fuzzy
    Word.where("name LIKE ?", "%#{keyword}%")
  end
end

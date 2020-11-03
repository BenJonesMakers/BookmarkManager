require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'the class method' do
      expect(Bookmark).to respond_to(:all)
    end

    it 'returns an array of bookmarks' do
      expect(Bookmark.all).to include('http://www.makersacademy.com')
    end
  end
end

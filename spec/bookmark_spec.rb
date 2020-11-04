require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'the class method' do
      expect(Bookmark).to respond_to(:all)
    end

    it 'returns an array of bookmarks' do

      connect_and_insert_test_data()

      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first.title).to eq 'Makers Academy'
    end
  end

  describe '#self.add_bookmark' do
    it 'the class method' do
      expect(Bookmark).to respond_to(:add_bookmark).with(2).arguments
    end

    it 'returns a list of bookmarks with new one added' do

      connect_and_insert_test_data()

      url = "http://www.wtf.com"
      title = "WTF"
      Bookmark.add_bookmark(url, title)
      bookmarks = Bookmark.all
      expect(bookmarks.last.title).to eq 'WTF'

    end
  end
end

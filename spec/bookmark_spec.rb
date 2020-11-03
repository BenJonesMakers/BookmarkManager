require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'the class method' do
      expect(Bookmark).to respond_to(:all)
    end

    it 'returns an array of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '#self.add_bookmark' do
    it 'the class method' do
      expect(Bookmark).to respond_to(:add_bookmark).with(1).argument
    end

    it 'returns a list of bookmarks with new one added' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
      url = "http://www.wtf.com"
      Bookmark.add_bookmark(url)
      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.wtf.com')

    end
  end
end

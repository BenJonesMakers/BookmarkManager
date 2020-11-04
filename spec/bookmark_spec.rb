require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'the class method' do
      expect(Bookmark).to respond_to(:all)
    end

    it 'returns an array of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy all Software');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google US');")

      bookmarks = Bookmark.all
      expect(bookmarks).to include('Makers Academy')
      expect(bookmarks).to include('Destroy all Software')
      expect(bookmarks).to include('Google US')
    end
  end

  describe '#self.add_bookmark' do
    it 'the class method' do
      expect(Bookmark).to respond_to(:add_bookmark).with(2).arguments
    end

    it 'returns a list of bookmarks with new one added' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy all Software');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google US');")
      url = "http://www.wtf.com"
      title = "WTF"
      Bookmark.add_bookmark(url, title)
      bookmarks = Bookmark.all
      expect(bookmarks).to include('WTF')

    end
  end
end

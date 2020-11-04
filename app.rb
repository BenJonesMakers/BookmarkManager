require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/test' do
    'Hello World'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  get '/bookmarks/add' do
    erb(:'bookmarks/add')
  end

  post '/bookmarks' do
    url = params['url']
    title = params['title']

    Bookmark.add_bookmark(url, title)

    redirect '/bookmarks'
  end

  run! if app_file == $0
end

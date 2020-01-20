require 'pg'

class Bookmark
  def self.create(url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmarks_manager_test')
    else
      connection = PG.connect(dbname: 'bookmarks_manager')
    end

    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end
  
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmarks_manager_test')
    else
      connection = PG.connect(dbname: 'bookmarks_manager')
    end
      result = connection.exec("SELECT * FROM bookmarks;")
      result.map { |bookmark| bookmark['url'] }
  end
end


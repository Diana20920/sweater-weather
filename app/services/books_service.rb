class BooksService
  def self.search_books(destination)
    response = conn.get("/search.json?q=#{destination}")
    parse_json(response)
  end

  private

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new("http://openlibrary.org")
  end
end

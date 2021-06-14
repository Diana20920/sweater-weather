class BookSearchFacade
  def self.search_by_destination(destination, forecast, quantity)
    response = BooksService.search_books(destination)

    total_found = response[:numFound]

    books = response[:docs].map do |data|
      BookResult.new(data)
    end.first(quantity)

    BookSearch.new(total_found, destination, forecast, books)
  end
end

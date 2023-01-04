require_relative '../lib/database_connection'
class BookRepository
def all
    DatabaseConnection.connect('book_store')
    # @SQL "SELECT  FROM ";
    sql = "SELECT id, title, author_name FROM books"
    result = DatabaseConnection.exec_params(sql, [])
     result.to_a
end

end
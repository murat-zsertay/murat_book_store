
require_relative './lib/book_repository'
repo = BookRepository.new
result = repo.all.map { | book_hash | "#{book_hash["id"]} - #{book_hash["title"]} - #{book_hash["author_name"]}" }.join("\n")
print result

# 1 - Nineteen Eighty-Four - George Orwell
# 2 - Mrs Dalloway - Virginia Woolf
# 3 - Emma - Jane Austen
# 4 - Dracula - Bram Stoker
# 5 - The Age of Innocence - Edith Wharton
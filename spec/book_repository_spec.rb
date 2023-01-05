require_relative '../lib/book_repository.rb'
require 'rspec'

def reset_book_store_table
    seed_sql = File.read('spec/seeds_book_store.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
    connection.exec(seed_sql)
  
end
  
  describe BookRepository do
    before(:each) do 
      reset_book_store_table
    end
  
    # (your tests will go here).
  it "should return 5 items in an array" do
  repo = BookRepository.new
  result = repo.all.length
  expect(result).to eq 5
  end
  
  end
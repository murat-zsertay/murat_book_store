```mermaid 
%%{init: { 'theme':'dark',"sequence": {
      "mirrorActors": true,
      "wrap": true
      "actorFontSize":16
    } } }%%
sequenceDiagram

participant t as terminal
    participant app as Main program (app.rb)
    participant br as BookRepository class <br /> (in lib/book_repository.rb)
    participant db_conn as DatabaseConnection class <br /> (in lib/database_connection.rb)
    participant db as Postgres database

    Note left of t: Flow of time <br />⬇ <br /> ⬇ <br /> ⬇ 

    t->>app: Runs `ruby app.rb`
    app->>br: Calls method `all` on BookRepository
    br->>db_conn: Opens connection to database book_store calling method `connect` on DatabaseConnection 
    db_conn->>db_conn: Opens database connection using PG and stores the connection 
    br->>db_conn: Sends SQL query by calling method `exec_params` on DatabaseConnection
    db_conn->>db: Sends query to database via the open database connection
    db->>db_conn: Returns an enumerable, containing a set of hashes for each record in the books table
    db_conn->>br: Returns an enumerable, containing a set of hashes for each record in the books table
    loop 
        br->>br: Loops through array and creates an Book object for every row
    end
    br->>app: Returns array of Book objects
    app->>t: Prints list of books to terminal
```

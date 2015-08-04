require "csv"
require "mysql"
$book_file = '/Users/jasonko/Dropbox/church/library/library_excel/book.csv'

def get_book(row)
  title = row[3]
  author = row[5]
  publisher = row[6]
  publish_year = row[7]
  orig_title = row[8]

  #remove white space in chinese
  if !!title.match(/^[[:alpha:]]+$/)
    puts title = title.gsub(' ', '')
  end
  if !!publisher.match(/^[[:alpha:]]+$/)
    puts publisher = publisher.gsub(' ', '')
  end

  # Map language code
  lang = case row[-1]
  when '國 語'
    'CHN'
  when '英 語'
    'ENG'
  else
    nil
  end
  return {
    :title => title,
    :author => author,
    :publisher => publisher,
    :year => publish_year,
    :title_original => orig_title,
    :language => lang
  }
end

def print(statement)
  puts statement + '\n'
end

#users.each do |user|
def insert(statement)
  id = 0
  begin
    con = Mysql.new '192.168.1.11', 'jko', 'password', 'library'
    #puts statement
    con.query(statement)
    rs = con.query('SELECT LAST_INSERT_ID();')
    id = rs.fetch_row

  rescue Mysql::Error => e
    puts e.errno
    puts e.error

  ensure
    con.close if con
  end
  return id[0]
end

users = []
CSV.foreach($book_file, headers: true, :header_converters => :symbol) do |row|
  book = get_book(row)
  # house_id = row[8]
  # user = getuser(row)
  # users.push(user)
  puts statement = "INSERT INTO items (title, title_original, publisher, author, language, year, created ) VALUES ('#{book[:title]}', '#{book[:title_original]}', '#{book[:publisher]}','#{book[:author]}','#{book[:language]}','#{book[:year]}','#{Time.now.to_s}');"
  puts book_id = insert(statement)
  # house = get_addr(house_id)
  # if (!house.nil?)
  #   puts statement = "INSERT INTO address (address1, city, state, zipcode, country, created) VALUES ('#{house[:street]}', '#{house[:city]}', '#{house[:state]}','#{house[:zipcode]}','#{house[:country]}','#{Time.now.to_s}');"
  #   puts house
  #   house_id = insert(statement)
  #   puts "user_id=#{user_id} | house_id=#{house_id}"
  #   puts statement = "INSERT INTO users_address (user_id, addr_id, created) VALUES ('#{user_id}', '#{house_id}', '#{Time.now.to_s}');"
  #   insert(statement)
  #   puts statement = "UPDATE users set phone = '#{house[:phone]}' WHERE id = #{user_id}"
  #   insert(statement)
  #   puts '---------'
  # end
end

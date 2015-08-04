require "csv"
require "mysql"
$data_file = '/Users/jasonko/Dropbox/church/library/library_excel/person_information.csv'
$addr_file = '/Users/jasonko/Dropbox/church/library/library_excel/address.csv'
$addr_csv = CSV.open( $addr_file, "r", headers: true, :header_converters => :symbol )

def getuser(row)
  lname = row[1]
  fname = row[2]
  mname = row[3]
  if(!lname.nil?)
    lname = lname.strip.capitalize
  else
    lname = '#####'
  end
  if(!fname.nil?)
    fname = fname.strip.split.map(&:capitalize).join(' ')
  end
  if(!mname.nil?)
    mname = row[3].gsub(' ', '')
  end
  if(fname.nil? && mname.nil?)
    fname = row[0]
  end
  return {:id => row[0], :lname => lname, :fname => fname, :mname => mname, :gender => row[6]}
end

def get_addr(house_id)
  address = open($addr_file).grep(/^#{house_id},/)
  #puts address[0]
  #1720,8185198716,34-48  89th Street,,"Jackson Heiacxkson",NY,11372,,FALSE
  if address[0].nil? then return
  else
    addr = address[0].split(',')
    a = { :phone => addr[1], :street => "#{addr[2]}, #{addr[3]}", :city => addr[4], :state => addr[5], :zipcode => addr[6], :country => addr[7]}
    return a
  end
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
CSV.foreach($data_file, headers: true, :header_converters => :symbol) do |row|
  house_id = row[8]
  user = getuser(row)
  users.push(user)
  statement = "INSERT INTO users (lname, fname, mname, gender, created) VALUES ('#{user[:lname]}', '#{user[:fname]}', '#{user[:mname]}','#{user[:gender]}','#{Time.now.to_s}');"
  user_id = insert(statement)
  house = get_addr(house_id)
  if (!house.nil?)
    puts statement = "INSERT INTO address (address1, city, state, zipcode, country, created) VALUES ('#{house[:street]}', '#{house[:city]}', '#{house[:state]}','#{house[:zipcode]}','#{house[:country]}','#{Time.now.to_s}');"
    puts house
    house_id = insert(statement)
    puts "user_id=#{user_id} | house_id=#{house_id}"
    puts statement = "INSERT INTO users_address (user_id, addr_id, created) VALUES ('#{user_id}', '#{house_id}', '#{Time.now.to_s}');"
    insert(statement)
    puts statement = "UPDATE users set phone = '#{house[:phone]}' WHERE id = #{user_id}"
    insert(statement)
    puts '---------'
  end
end

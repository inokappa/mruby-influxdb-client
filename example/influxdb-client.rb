config = {
  :url  => "http://127.0.0.1:8086",
  :db   => "foo",
  :ua   => "mruby-influxdb-client",
  :user => "root",
  :pass => "root",
}

i = Influxdb::Client.new(config)

points = [ 19.1, "hogehoge" ]
query = "select * from Disk_Used limit 1"

data = [{
  :name => "Disk_Used",
  :columns => ["value", "host"],
  :points => [
    points
  ]
}]

puts "request:  #{JSON::stringify(data)}"
puts "response: #{i.post(data)["body"]}"

puts "response: #{i.get_metrics(query).body}"

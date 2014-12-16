config = {
  :url  => "http://127.0.0.1:8086",
  :db   => "foo",
  :ua   => "mruby-influxdb-client",
  :user => "root",
  :pass => "root",
}

i = Influxdb::Client.new(config)

data = [{
  :name => "Disk_Used",
  :columns => ["value", "host"],
  :points => [
    [19.1, "hogehoge"]
  ]
}]

puts "request:  #{JSON::stringify(data)}"
puts "response: #{i.post(data)["body"]}"

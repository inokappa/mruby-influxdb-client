# InfluxDB client for mruby

## require mrbgems

 * mruby-httprequest
 * mruby-json
 * mruby-base64

## install by mrbgems

```bash
MRuby::Build.new do |conf|

  conf.gem :git => 'https://github.com/inokappa/mruby-influxdb-client.git'

end
```

## example

```ruby
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
```

## InfluxDB

### Documents

 * [Reading and Writing Data](http://influxdb.com/docs/v0.7/api/reading_and_writing_data.html)
 * [Administration](http://influxdb.com/docs/v0.7/api/administration.html)

### Create Database

```bash
curl -X POST 'http://localhost:8086/db?u=root&p=root' -d '{"name": "foo"}'
```

### Query

```bash
curl -G 'http://localhost:8086/db/foo/series?u=root&p=root' --data-urlencode "q=select * from Disk_Used"
```

# License
under the MIT License:

* http://www.opensource.org/licenses/mit-license.php


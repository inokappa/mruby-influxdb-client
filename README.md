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

### Single Datapoint

```ruby
#!/path/to/mruby

config = {
  :url  => "http://127.0.0.1:8086",
  :db   => "foo",
  :ua   => "mruby-influxdb-client",
  :user => "root",
  :pass => "root",
}

i = Influxdb::Client.new(config)

points = [ ARGV[0].to_f, "hogehoge" ]
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
```

```bash
/path/to/influxdb-client.rb `cho $RANDOM`
```

### Multi Datapoints

```ruby
#!/path/to/mruby

config = {
  :url  => "http://127.0.0.1:8086",
  :db   => "foo",
  :ua   => "mruby-influxdb-client",
  :user => "root",
  :pass => "root",
}

i = Influxdb::Client.new(config)

points = [ ARGV[0].to_f, ARGV[1].to_f, ARGV[2].to_f ]
query = "select * from Test_Metrics limit 1"

data = [{
  :name => "Test_Metrics",
  :columns => ["value1", "value2", "value3"],
  :points => [
    points
  ]
}]

puts "request:  #{JSON::stringify(data)}"
puts "response: #{i.post(data)["body"]}"

puts "response: #{i.get_metrics(query).body}"
```

```bash
/path/to/influxdb-client.rb `echo $RANDOM` `echo $RANDOM` `echo $RANDOM`
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

result.

```bash
curl -s -G 'http://localhost:8086/db/foo/series?u=root&p=root' --data-urlencode "q=select * from Disk_Used limit 1" | jq .
[
  {
    "points": [
      [
        1418742770498,
        140001,
        19.1,
        "hogehoge"
      ]
    ],
    "columns": [
      "time",
      "sequence_number",
      "value",
      "host"
    ],
    "name": "Disk_Used"
  }
]
```

### Visualize

Visualized using the [tasseo](https://github.com/obfuscurity/tasseo).


# License
under the MIT License:

* http://www.opensource.org/licenses/mit-license.php


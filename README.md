# InfluxDB client for mruby

require mruby-httprequest mruby-json

## install by mrbgems
```bash
git clone git://github.com/inokappa/mruby-influxdb-client.git
cp -pr mruby-influxdb-client ${MRUBY_ROOT}/mrbgems/g/.
echo mruby-influxdb-client >> ${MRUBY_ROOT}/mrbgems/GEMS.active
cd ${MRUBY_ROOT}
make
./bin/mruby ${MRUBY_ROOT}/mrbgems/g/mruby-influxdb-client/example/mruby-influxdb-client.rb
```

## example

```ruby
config = {
  :url  => "http://127.0.0.1", 
  :db   => "foo"
  :ua   => "mruby-influxdb-client",
  :user => "",
  :pass => "",
}

i = Influxdb::Client.new(config)

data = {
  :name => "Disk_Used",
  :columns => ["value, "host"],
  :points => [
    [19.1, "extend"]
  ]
}

puts "request:  #{JSON::stringify(data)}"
puts "response: #{i.post(data)["body"]}"
```

# License
under the MIT License:

* http://www.opensource.org/licenses/mit-license.php



class Influxdb
  class Client
    def initialize(config)
      @url  = config[:url]
      @user = config[:user]
      @pass = config[:pass]
      @ua   = config[:ua]
      @db   = config[:db]
      @request = {
        'Content-Type'   => "application/json-rpc",
        'User-Agent'     => @ua,
      }
    end
    def request_url
      #  /db/<database>/series?u=<user>&p=<pass>
      @url + "/db/" + @db + "series?" + "u=" + @user + "&" + "p=" + @pass
    end
    def headers
      @request
    end
    def post(data)
      req_json = {
        :params  => data[:params],
      }
      http = HttpRequest.new()
      http.post(request_url, JSON::stringify(req_json), @request)
    end
  end
end

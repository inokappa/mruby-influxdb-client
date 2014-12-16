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
    def post(data)
      request_url = "#{@url}/db/#{@db}/series?u=#{@user}&p=#{@pass}"
      http = HttpRequest.new()
      http.post(request_url, JSON::stringify(data), @request)
    end
  end
end

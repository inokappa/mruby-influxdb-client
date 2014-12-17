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

    def http_request
      HttpRequest.new()
    end

    def post(data)
      request_url = "#{@url}/db/#{@db}/series?u=#{@user}&p=#{@pass}"
      http_request.post(request_url, JSON::stringify(data), @request)
    end

    def get_metrics(query)
      query = HTTP::URL::encode(query)
      request_url = "#{@url}/db/#{@db}/series?q=#{query}&u=#{@user}&p=#{@pass}"
      http_request.get(request_url, nil, @request)
    end
  end
end

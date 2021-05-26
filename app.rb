require_relative 'handler'

class App
  def call(env)
    @request = Rack::Request.new(env)
    response
    [status, headers, body]
  end

  private

  def response
    if @request.path_info != '/time'
      return wrong_path
    end

    @handler = Handler.new(@request.params)
    @handler.check_format

    @handler.success? ? formatted_time : unknown_format
  end

  def status
    @status_code
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    ["#{@message}\n"]
  end

  def formatted_time
    @status_code = 200
    @message = @handler.time
  end

  def unknown_format
    @status_code = 400
    @message = "Unknown time format #{@handler.incorrect}"
  end

  def wrong_path
    @status_code = 404
    @message = 'Page not found'
  end
end
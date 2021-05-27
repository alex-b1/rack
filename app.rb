require_relative 'handler'

class App
  def call(env)
    @request = Rack::Request.new(env)
    handle_response
  end

  private

  def handle_response
    if @request.path_info != '/time'
      return response(404, 'Page not found')
    end

    handler = Handler.new(@request.params)
    handler.check_format

    if handler.success?
      response(200, handler.time)
    else
      response(400, "Unknown time format #{handler.incorrect}")
    end

  end

  def response(code, message)
    [code, { 'Content-Type' => 'text/plain' }, ["#{message}\n"]]
  end
end
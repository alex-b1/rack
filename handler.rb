class Handler
  TIME_LIST = {year: "%Y", month: "%m", day: "%d", hour: "%Hh", minute: "%Mm", second: "%Ss"}

  attr_reader :incorrect

  def initialize(params)
    @params = params['format'].split(',')
  end

  def check_format
    @correct, @incorrect = @params.partition { |i| TIME_LIST[i.to_sym] }
  end

  def success?
    @incorrect.empty?
  end

  def time
    formats = @correct.map { |i| TIME_LIST[i.to_sym]}
    Time.now.strftime(formats.join('-'))
  end
end
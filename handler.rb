class Handler
  TIME_LIST = {year: "%Y", month: "%m", day: "%d", hour: "%Hh", minute: "%Mm", second: "%Ss"}

  attr_reader :incorrect

  def initialize(params)
    @params = params['format'].split(',')
  end

  def check_format
    @correct = []
    @incorrect = []
    @params.each do |i|
      if TIME_LIST[i.to_sym]
        @correct << TIME_LIST[i.to_sym]
      else
        @incorrect << i
      end
    end
  end

  def success?
    @incorrect.empty?
  end

  def time
    Time.now.strftime(@correct.join('-'))
  end
end
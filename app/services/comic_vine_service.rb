class ComicVineService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new('http://localhost:3000/v1')
  end

end

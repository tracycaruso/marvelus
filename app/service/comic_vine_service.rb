class ComicvineService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new('http://www.comicvine.com')
    require 'pry';binding.pry
  end

  def characters
    #build database as users search for things
    parse(connection.get("api/characters/?api_key=#{ENV['COMIC_API_KEY']}&filter=name:Superman&format=json"))
  end


  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end


end

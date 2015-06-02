class ComicVineService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new('http://www.comicvine.com')
  end

  def character(search)
    search = "Superman"
    #build database as users search for things
    response = parse(connection.get("api/character/?api_key=#{ENV['COMIC_API_KEY']}&limit=1&filter=name:#{search}&format=json"))
    require 'pry';binding.pry
  end


  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end

end

#filters by name and only 1 character  
#http://www.comicvine.com/api/characters/?api_key=675036cffc0144811da8a954e33a93b633386eec&limit=1&filter=name:Superman&format=json
# hero = search["results"].first #what the user searches for
# JSON.parse(response.body)
# hero[""]

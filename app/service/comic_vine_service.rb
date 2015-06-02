class ComicvineService
  attr_reader :connection

  def initialize
    connection = Faraday.new(url: 'http://www.comicvine.com') do |faraday|
      faraday.request  :url_encoded            
      faraday.response :logger                  
      faraday.adapter  Faraday.default_adapter  
    end
  end

  def characters
    #build database as users search for things
    response = connection.get("api/characters/?api_key=#{ENV['COMIC_API_KEY']}&filter=name:Superman&format=json")
    # connection.get('/characters/?api_key=675036cffc0144811da8a954e33a93b633386eec&filter=name:Superman&format=json'   , params)
    response.body
  end


end

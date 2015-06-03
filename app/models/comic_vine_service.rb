class ComicVineService
  attr_reader :client

  def initialize
    @client = Hurley::Client.new('http://www.comicvine.com')
    client.query['api_key']    =  ENV['COMIC_API_KEY']
    client.query['format']     = 'json'  
  end

  def all_characters
    batch_size = 1
    offset     = 0
    characters = []

    loop do
      response = client.get("api/characters") do |request|
        request.query[:limit]    = batch_size    #the limit is how many records to pull after the offset
        request.query[:offset]   = offset  #offset is the position where you start counting
        request.query[:field_list] = "name,birth,deck,count_of_issue_appearances,gender,id,real_name,publisher,origin,image"
        #only marvel and dc publisher
      end

      offset += batch_size  #increment the offset by 100 each iteration
      response_data = parse(response)     #response_data is a hash
      characters += response_data[:results] #response_data[:results] is an array of 100 hashes of data
      if offset >= 2
      # if offset >= response_data[:number_of_total_results]
        break
      end
    end
    characters 
    # character# Character.create(character_params)
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end

#filters by name and only 1 character  
#http://www.comicvine.com/api/characters/?api_key=675036cffc0144811da8a954e33a93b633386eec&limit=1&filter=name:Superman&format=json
#http://www.comicvine.com/api/characters/?api_key=675036cffc0144811da8a954e33a93b633386eec&limit=1&filter=name:#{&format=json
# hero = search["results"].first #what the user searches for
# JSON.parse(response.body)
# hero[""]

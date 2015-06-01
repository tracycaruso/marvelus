

conn = Faraday.new(:url => 'http://www.comicvine.com/api') do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  faraday.response :logger                  # log requests to STDOUT
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end
# params = { api_key: ENV['comic_vine_key'] }
# conn.get('characters', params)
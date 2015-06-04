class Superhero < ActiveRecord::Base
  def self.service
      @service ||= ComicVineService.new
  end



end

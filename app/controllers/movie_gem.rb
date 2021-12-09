class MovieGem < Tmdb::Movie
  def self.top_rated_list(page={})
    result = Resource.new("/movie/top_rated?page=#{page}").get
    self.new(result)
  end
end

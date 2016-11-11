class Search
  def self.user_search(search_term)
    return User.none if search_term.empty?
    search_term = "%#{search_term}%"
    User.where("tag LIKE ?", search_term)
  end
end

class QuestionSearch
  def self.search(term, options = {})
    search_options = {
      load: { include: "user" },
      page: options[Paginate::Config.param_name],
      per_page: Paginate::Config.size + 1
    }

    Question.search(search_options) do
      query { string term }
      sort  { by :sorting_date, "desc" }
    end
  end
end

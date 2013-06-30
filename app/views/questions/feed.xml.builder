atom_feed do |feed|
  feed.title @question.title
  feed.updated @answers.all.first.try(:created_at)

  @answers.each do |answer|
    feed.entry answer, url: question_url(anchor: dom_id(answer)) do |entry|
      entry.title t("answer.feed.replied", name: answer.user.name)
      entry.content simple_format(answer.content), type: "html"

      entry.author do |author|
        author.name answer.user.name
      end
    end
  end
end

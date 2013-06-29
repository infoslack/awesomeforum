require "spec_helper"

feature "Reply to question" do
  scenario "when sending valid data" do
    question = questions(:ruby)

    login_as users(:john)
    visit root_path
    click_link question.title

    fill_in label("answer.content"), with: "This is the correct answer"
    click_button submit("answer.create")

    expect(current_path).to eql(question_path(question))
    expect(page).to have_content(notice("answers.create"))
    expect(page).to have_content("This is the correct answer")
  end

  scenario "when sending invalid data" do
    question = questions(:ruby)

    login_as users(:john)
    visit root_path
    click_link question.title

    click_button submit("answer.create")

    expect(current_path).to eql(question_path(question))
    expect(page).to have_content(t("activerecord.errors.messages.blank"))
  end

  scenario "when unlogged" do
    question = questions(:ruby)
    visit root_path
    click_link question.title

    translation = t("question.must_be_logged_to_answer_html",
      url: login_path(return_to: question_path(question))
    ).strip

    html = Nokogiri::HTML(page.body)
    actual = html.css(".disclaimer").inner_html.strip

    expect(actual).to eql(translation)
  end
end

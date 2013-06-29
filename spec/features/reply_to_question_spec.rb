require "spec_helper"

feature "Reply to question" do
  scenario "when sending valid data" do
    question = questions(:ruby)

    login_as users(:john)
    visit root_path
    click_link question.title

    fill_in label("answer.content"), with: "Some answer"
    click_button submit("answer.create")

    expect(current_path).to eql(question_path(question))
    expect(page).to have_content(notice("answers.create"))
    expect(page).to have_content("Some answer")
  end
  scenario "when sending invalid data"
  scenario "when unlogged"
end

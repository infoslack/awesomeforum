require "spec_helper"

feature "Ask new question" do
  scenario "when providing valid info" do
    login_as users(:john)
    click_link t("menu.ask")

    fill_in label("question.title"), with: "Some question"
    fill_in label("question.content"), with: "Some content"
    select categories(:ruby).name, from: label("question.category")
    click_button submit("question.create")

    expect(current_path).to match(%r[\A/perguntas/\d+\z])
    expect(page).to have_content(notice("questions.create"))
  end

  scenario "when providing invalid info" do
    login_as users(:john)
    click_link t("menu.ask")
    click_button submit("question.create")

    expect(current_path).to eql(new_question_path)
    expect(page).to have_content(t("form.error_message"))
  end

  scenario "when not logged in" do
    visit root_path
    click_link t("menu.ask")

    expect(current_path).to eql(login_path)
    expect(page).to have_content(alert("require_logged_user"))
  end
end

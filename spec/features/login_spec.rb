require "spec_helper"

feature "Login" do
  scenario "with valid credentials" do
    visit root_path
    click_link t("menu.login")

    fill_in label("user.email"), with: users(:john).email
    fill_in label("user.password"), with: "test"
    click_button submit("login")

    expect(current_path).to eql(root_path)
    expect(page).to have_content(t("greeting", name: users(:john).name))
  end

  scenario "with invalid credentials" do
    visit root_path
    click_link t("menu.login")
    click_button submit("login")

    expect(current_path).to eql(login_path)
    expect(page).to have_content("E-mail/senha inválidos.")
  end

  scenario "when already logged in" do
    login_as users(:john)
    visit login_path

    expect(current_path).to eql(root_path)
  end

  scenario "logouts from app" do
    login_as users(:john)
    visit root_path
    click_button t("menu.logout")

    expect(current_path).to eql(root_path)
    expect(page).not_to have_content(t("greeting", name: users(:john).name))
  end
end

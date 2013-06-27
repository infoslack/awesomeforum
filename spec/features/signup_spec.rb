require "spec_helper"

feature "Signup" do
  scenario "when sending valid info" do
    visit "/"
    click_link t("menu.signup")

    fill_in label("user.name"), with: "John Doe"
    fill_in label("user.email"), with: "johj@example.org"
    fill_in label("user.password"), with: "test"
    fill_in label("user.password_confirmation"), with: "test"
    click_button submit("user.create")

    expect(current_path).to eql("/entrar")
    expect(page).to have_content(notice("signup.create"))
  end

  scenario "when sending invalid info" do
    visit "/"
    click_link t("menu.signup")
    click_button submit("user.create")

    expect(current_path).to eql("/cadastre-se")
    expect(page).to have_content(form_error_message)
  end

  scenario "when already logged in"
end

module FeatureHelpers
  def login_as(user)
    visit root_path
    click_link t("menu.login")

    fill_in label("user.email"), with: users(:john).email
    fill_in label("user.password"), with: "test"
    click_button submit("login")
  end

  def t(*args)
    I18n.t(*args)
  end

  def label(scope)
    t(scope, scope: "form.labels")
  end

  def submit(scope)
    t(scope, scope: "helpers.submit")
  end

  def notice(scope)
    t("#{scope}.notice", scope: "flash")
  end

  def alert(scope)
    t("#{scope}.alert", scope: "flash")
  end

  def form_error_message
    t("form.error_message")
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
end

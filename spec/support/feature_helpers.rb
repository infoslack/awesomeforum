module FeatureHelpers
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

  def form_error_message
    t("form.error_message")
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
end

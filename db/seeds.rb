file = Rails.root.join("db/seeds/#{Rails.env}.rb")
require file if file.exist?

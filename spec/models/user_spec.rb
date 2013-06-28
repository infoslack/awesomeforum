require "spec_helper"

describe User do
  context "validations" do
    it "requires name" do
      user = User.create(name: nil)
      expect(user).to have_at_least(1).error_on(:name)
    end

    it "requires email" do
      user = User.create(email: nil)
      expect(user).to have_at_least(1).error_on(:email)
    end

    it "requires valid email" do
      user = User.create(email: "invalid")
      expect(user).to have_at_least(1).error_on(:email)
    end

    %w[
      john.doe@example.co.uk
      john+info@example.com.br
      john@example.me
      john@example.info
      john1234@example.io
    ].each do |email|
      it "accepts #{email} as valid email" do
        user = User.create(email: email)
        expect(user).to have(:no).errors_on(:email)
      end
    end

    it "rejects duplicated emails" do
      existing = users(:john)
      user = User.create(email: existing.email)
      expect(user).to have_at_least(1).error_on(:email)
    end

    it "requires password" do
      user = User.create(password: nil)
      expect(user).to have_at_least(1).error_on(:password)
    end

    it "requires password confirmation" do
      user = User.create(password: "test", password_confirmation: "invalid")
      expect(user).to have_at_least(1).error_on(:password_confirmation)
    end
  end
end

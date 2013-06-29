require "spec_helper"

describe Category do
  context "validations" do
    it "requires name" do
      category = Category.create(name: nil)
      expect(category).to have_at_least(1).error_on(:name)
    end
  end
end

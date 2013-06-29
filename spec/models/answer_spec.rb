require "spec_helper"

describe Answer do
  context "validations" do
    it "requires user" do
      answer = Answer.create(user: nil)
      expect(answer).to have_at_least(1).error_on(:user)
    end

    it "requires question" do
      answer = Answer.create(question: nil)
      expect(answer).to have_at_least(1).error_on(:question)
    end

    it "requires content" do
      answer = Answer.create(content: nil)
      expect(answer).to have_at_least(1).error_on(:content)
    end

    it "requires minimum length" do
      answer = Answer.create(content: "a" * 10)
      expect(answer).to have_at_least(1).error_on(:content)
    end

    it "accepts required length" do
      answer = Answer.create(content: "a" * 15)
      expect(answer).to have(:no).errors_on(:content)
    end
  end
end

require "spec_helper"

describe Question do
  context "validations" do
    it "requires title" do
      question = Question.create(title: nil)
      expect(question).to have_at_least(1).error_on(:title)
    end

    it "requires content" do
      question = Question.create(content: nil)
      expect(question).to have_at_least(1).error_on(:content)
    end

    it "requires user" do
      question = Question.create(user_id: nil)
      expect(question).to have_at_least(1).error_on(:user)
    end

    it "requires category" do
      question = Question.create(category_id: nil)
      expect(question).to have_at_least(1).error_on(:category)
    end
  end

  it "updates the hits count" do
    question = questions(:ruby)

    expect {
      question.hit!
    }.to change { question.reload.hits }.by(1)
  end
end

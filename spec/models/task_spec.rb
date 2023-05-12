require "rails_helper"

RSpec.describe Task, type: :model do
  describe "validations" do
    it "validates presence of title" do
      task = Task.new(description: "Some description", status: "Completed")
      task.valid?
      expect(task.errors[:title]).to include("can't be blank")
    end

    it "validates presence of description" do
      task = Task.new(title: "Some title", status: "Completed")
      task.valid?
      expect(task.errors[:description]).to include("can't be blank")
    end
  end

  describe "enums" do
    it "defines the correct enum values" do
      expect(Task.statuses).to eq({
        "Not Started" => 0,
        "In Progress" => 1,
        "Completed" => 2
      })
    end

    it "sets the default status to 'Not Started'" do
      task = Task.new(title: "Some title", description: "Some description")
      expect(task.status).to eq("Not Started")
    end
  end
end

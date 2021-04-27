require 'rails_helper'

RSpec.describe Task, type: :model do
  context "validate test" do
    it 'ensures title presence'do
      task = Task.new(title: 'title').save
    end
    it 'ensures description presence'do
      task = Task.new(description: 'title').save
    end
    it 'ensures boolean presence'do
      task = Task.new(is_done: false).save
    end
  end
end

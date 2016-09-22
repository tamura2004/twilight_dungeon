require "rails_helper"

RSpec.describe Tool::Notebook, type: :model do
  subject{Tool::Notebook.new}

  describe "#initialize" do
    it{should have_attributes message:""}
    it{should respond_to :log}
  end

  describe "#log" do
    it {
      expect {
        subject.log "一行目"
        subject.log "二行目"
      }.to change {
        subject.message
      }.to "一行目\n二行目\n"
    }
  end
end

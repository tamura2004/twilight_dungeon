require "rails_helper"

RSpec.describe DungeonMastersGuide::Attack, type: :model do
  let(:action){build :action}
  subject{DungeonMastersGuide::Attack.new action}

  describe "#initialize" do
    %i(run! attack! normal_hit! critical_hit! fumble!).each do |method|
      it{should respond_to method}
    end
  end

end

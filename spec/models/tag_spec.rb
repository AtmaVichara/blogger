require 'rails_helper'

describe Tag, type: :model do
  describe 'relationships' do
    it { should have_many(:taggings) }
    it { should have_many(:articles).through(:taggings) }
  end
  describe 'instance methods' do
    describe "#to_s" do
      it "returns name of tags" do
        tag = Tag.create!(name: 'balogne')

        expect(tag.to_s).to eq('balogne')
      end
    end
  end
end

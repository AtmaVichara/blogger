require 'rails_helper'

describe Article, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should have_many(:comments) }
  end
  describe "instance methods" do
    describe "#tag_list" do
      it "turns associated strings into tags" do
        article = Article.create!(title: "They Have Arrived!", body: "The hyperdimensional starwarpers have appeared in a starbucks!!!")
        article.tags.create(name: "invasion")
        article.tags.create(name: "danger")

        expect(article.tag_list).to eq("invasion, danger")
      end
    end
  end
end

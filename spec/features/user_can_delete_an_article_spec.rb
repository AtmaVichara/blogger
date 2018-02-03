require 'rails_helper'

describe "user deletes an article" do
  describe "the link from the show page" do
    it "displays all articles without the deleted entry" do
      article_1 = Article.create!(title: "They Have Arrived!", body: "The hyperdimensional starwarpers have appeared in a starbucks!!!")
      article_2 = Article.create!(title: "They Have Left...", body: "They hyperdimensional starwarpers were unimpressed and left...")

      visit article_path(article_1)
      click_link "Delete"

      expect(page).to have_content("You have Successfully Deleted the #{article_1.title}")
      expect(current_path).to eq(articles_path)
      expect(page).to have_link(article_2.title)
      expect(page).to_not have_link(article_1.title)
    end
  end
end

require 'rails_helper'

describe "user sees all articles" do
  describe "they visit /articles" do
    it "displays all articles" do
      article_1 = Article.create!(title: "Breaking News on Unauthorized Cashews", body: "A recent influx of unauthorized cashews has spawned a frenzy among the public and a crashing in the stocks of cashews. By god the horror")
      article_2 = Article.create!(title: "All Cashews Deported", body: "With the recent influx of unauthorized cashews there has been a massive undertaking for deportations of said cashews. As of now many have been deported back to salads and pies.")
      visit '/articles'

      expect(page).to have_link(article_1.title)
      expect(page).to have_content(article_1.body)
      expect(page).to have_link(article_2.title)
      expect(page).to have_content(article_2.body)
      expect(page).to have_link("Create a New Article")
    end
  end
end

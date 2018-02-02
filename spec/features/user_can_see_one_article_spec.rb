require 'rails_helper'

describe "user can see one article" do
  describe "they link from the articles index" do
    it "displays information for one article" do
      article = Article.create!(title: "Breaking News on Unauthorized Cashews", body: "A recent influx of unauthorized cashews has spawned a frenzy among the public and a crashing in the stocks of cashews. By god the horror")

      visit articles_path

      click_link article.title

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.description)
      expect(page).to have_link("Back to All Articles")
    end
  end
end

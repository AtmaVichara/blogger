require 'rails_helper'

describe "user can see one article" do
  describe "they link from the articles index" do
    it "displays information for one article" do
      article = Article.create!(title: "Breaking News on Unauthorized Cashews", body: "A recent influx of unauthorized cashews has spawned a frenzy among the public and a crashing in the stocks of cashews. By god the horror")
      comment1 = article.comments.create(author_name: 'Grunkle Stan', body: "These are a menace on the community")
      comment2 = article.comments.create(author_name: 'Josh Gumption', body: "I say let them live in peace!! They are tasty!")

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
      expect(page).to have_link("Back to All Articles")
      expect(page).to have_content(comment1.author_name)
      expect(page).to have_content(comment1.body)
      expect(page).to have_content(comment2.author_name)
      expect(page).to have_content(comment2.body)
    end
  end

  describe "they fill in comment form" do
    it "displays comment on the article show" do
      article = Article.create!(title: "Breaking News on Unauthorized Cashews", body: "A recent influx of unauthorized cashews has spawned a frenzy among the public and a crashing in the stocks of cashews. By god the horror")

      visit article_path(article)

      fill_in "comment[author_name]", with: "Grunkle Stan"
      fill_in "comment[body]", with: "These are a menace on the community"
      click_link "Submit"

      expect(page).to have_content("Grunkle Stan")
      expect(page).to have_content("These are a menace on the community")
    end
  end

  describe "they click on back to all articles" do
    it "displays index page" do
      article = Article.create!(title: "Breaking News on Unauthorized Cashews", body: "A recent influx of unauthorized cashews has spawned a frenzy among the public and a crashing in the stocks of cashews. By god the horror")

      visit articles_path

      click_link article.title
      click_link "Back to All Articles"

      expect(current_path).to eq('/articles')
    end
  end
end

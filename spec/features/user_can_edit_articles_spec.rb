require 'rails_helper'

describe "user edits article" do
  describe "the link in show page" do
    it "allow user to edit article" do
      article = Article.create!(title: "They Have Arrived!", body: "The hyperdimensional starwarpers have appeared in a starbucks!!!")

      visit article_path(article)
      click_link "Edit"

      fill_in "article[title]", with: "They Have Not Arrived..."
      fill_in "article[body]", with: "Our source just took too much of his microdose."
      click_on "Edit Article"

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content("They Have Not Arrived...")
      expect(page).to_not have_content("They Have Arrived!")
      expect(page).to have_content("Our source just took too much of his microdose.")
      expect(page).to_not have_content("The hyperdimensional starwarpers have appeared in a starbucks!!!")
    end
  end
end

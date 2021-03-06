require 'rails_helper'

describe "user creates new articles" do
  describe "they link from the index page" do
    describe "they fill in the title and body" do
      it "creates new article" do
        visit articles_path
        click_link "Create a New Article"

        expect(current_path).to eq(new_article_path)

        fill_in "article[title]", with: "Unauthorized CASHEWS!!"
        fill_in "article[body]", with: "There are unauthorized cashews in the vacinity! Everyone be aware of these little monsters"
        fill_in "article[tag_list]", with: "cashews, dangerous"
        click_on "Create Article"

        expect(page).to have_content('cashews dangerous')
        expect(page).to have_content("You have Successfully Created Unauthorized CASHEWS!!")
        expect(page).to have_content("Unauthorized CASHEWS!!")
        expect(page).to have_content("There are unauthorized cashews in the vacinity! Everyone be aware of these little monsters")
      end
    end
  end
end

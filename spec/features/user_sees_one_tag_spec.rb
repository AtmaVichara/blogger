require "rails_helper"

describe 'user sees one tag' do
  describe 'they link from the articles show' do
    it 'displays information for one tag' do
      article = Article.create!(title: "Breaking News on Unauthorized Cashews", body: "A recent influx of unauthorized cashews has spawned a frenzy among the public and a crashing in the stocks of cashews. By god the horror")
      tag = article.tags.create!(name: 'danger')

      visit article_path(article)

      click_link tag.name

      expect(page).to have_content('Tag: Danger')
    end
  end
end

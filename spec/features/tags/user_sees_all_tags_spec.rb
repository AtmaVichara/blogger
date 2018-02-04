require 'rails_helper'

describe 'user sees all tags' do
  describe 'they visit /tags' do
    it 'displays all tags' do
      tag1 = Tag.create!(name: 'danger')
      tag2 = Tag.create!(name: 'helpful')
      tag3 = Tag.create!(name: 'spicy')

      visit tags_path

      expect(page).to have_link(tag1.name)
      expect(page).to have_link(tag2.name)
      expect(page).to have_link(tag3.name)
    end
  end
end

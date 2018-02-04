require 'rails_helper'

describe 'user deletes a tag' do
  describe 'link from the show page' do
    it 'displays all tags without the deleted tag' do
      tag1 = Tag.create!(name: 'danger')
      tag2 = Tag.create!(name: 'helpful')
      tag3 = Tag.create!(name: 'spicy')

      visit tag_path(tag1)
      click_link "Delete"

      expect(page).to have_content("You have Successfully Deleted the #{tag1.name} Tag!")
      expect(current_path).to eq(tags_path)
      expect(page).to_not have_link(tag1.name)
      expect(page).to have_link(tag2.name)
      expect(page).to have_link(tag3.name)
    end
  end
end

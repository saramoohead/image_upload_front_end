require 'rails_helper'

feature 'Uploading' do
  scenario 'an image' do
    visit '/'
    attach_file('file', 'LostAndFound-OliverJeffers.jpg')
    click_on 'Upload image'
    # expect(page).to have_xpath("//img[contains(@src,'LostAndFound-OliverJeffers.jpg')]")
    expect(page).to have_css("img[src*='LostAndFound-OliverJeffers.jpg']")
  end
end

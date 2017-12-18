feature 'Posting new peeps' do

  scenario 'Peeps can be created and posted' do
    visit '/peeps'
    fill_in :content, with: 'You underestimate my power!'
    click_on 'Post Peep'

    within 'ul#peeps' do
      expect(page).to have_content('You underestimate my power!')
    end
  end
end

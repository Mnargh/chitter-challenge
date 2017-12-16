feature "Viewing Peeps" do
  scenario "User can see existing peeps on the peeps page" do
    Peep.create(:content, 'This is a peep')

    visit '/peeps'

    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('This is a peep')
    end
  end
end

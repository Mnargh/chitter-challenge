feature "Viewing Peeps" do
  scenario "User can see existing peeps on the peeps page" do
    Peep.create(content: "This is a peep")

    visit '/peeps'

    expect(page.status_code).to eq 200
    within 'ol#peeps' do
      expect(page).to have_content('This is a peep')
    end
  end

  scenario "User can see existing peeps in chronological order" do
    post_peep1
    post_peep2

    visit '/peeps'

    within 'ol#peeps' do
      ("Be careful not to choke on your aspirations").should appear_before("Take a seat, young Skywalker")
    end
  end
end

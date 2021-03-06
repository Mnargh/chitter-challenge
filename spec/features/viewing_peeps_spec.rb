feature "Viewing Peeps" do
  scenario "User can see existing peeps on the peeps page" do
    Peep.create(content: "This is a peep")

    visit '/peeps'

    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('This is a peep')
    end
  end

  scenario "User can see existing peeps in chronological order" do
    post_peep1
    post_peep2

    visit '/peeps'

    within 'ul#peeps' do
      ("Take a seat, young Skywalker").should appear_before("Be careful not to choke on your aspirations")
    end
  end

  scenario "User can see time when a peep was posted" do
    post_peep1
    post_peep2
    visit '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content(Time.now.strftime("%Y-%m-%e %H:%M"))
    end
  end
end

def post_peep1
  visit '/peeps'
  fill_in :content, with: "Be careful not to choke on your aspirations"
  click_on "Post Peep"
end

def post_peep2
  visit '/peeps'
  fill_in :content, with: "Take a seat, young Skywalker"
  click_on "Post Peep"
end

def sign_up
  visit '/users/new'
  fill_in :email,    with: 'Darth@Plagueis.com'
  fill_in :password, with: 'Dark Side'
  fill_in :password_confirmation, with: 'Dark Side'
  click_button 'Sign up'
end

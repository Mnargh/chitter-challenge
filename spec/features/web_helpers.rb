def post_peep1
  visit 'peeps/new'
  fill_in :content, with: "Be careful not to choke on your aspirations"
  click_on "Post Peep"
end

def post_peep2
  visit 'peeps/new'
  fill_in :content, with: "Take a seat, young Skywalker"
  click_on "Post Peep"
end

require 'rails_helper'

RSpec.describe BackgroundPic do
  it 'exists' do
    hash = {:id=>"A4RpHR83luM",
             :created_at=>"2021-05-01T04:12:54-04:00",
             :updated_at=>"2021-06-11T03:20:36-04:00",
             :promoted_at=>nil,
             :width=>5954,
             :height=>3969,
             :color=>"#0c2626",
             :blur_hash=>"L867}^NGNIxY0gxaxENb==RkWXs,",
             :description=>"Night Time Downtown Denver",
             :alt_description=>"city skyline during night time",
             :urls=>
              {:raw=>
                "https://backgroundpics.unsplash.com/000",
               :full=> # using this one!
                "https://backgroundpics.unsplash.com/full_url",
               :regular=>
                "https://backgroundpics.unsplash.com/000",
               :small=>
                "https://backgroundpics.unsplash.com/000",
               :thumb=>
                "https://backgroundpics.unsplash.com/000"},
             :links=>
              {:self=>"https://api.unsplash.com/photos/A4RpHR83luM",
               :html=>"https://unsplash.com/photos/A4RpHR83luM", #using this one!
               :download=>"https://unsplash.com/photos/A4RpHR83luM/download",
               :download_location=>
                "https://api.unsplash.com/photos/000"},
             :categories=>[],
             :likes=>2,
             :liked_by_user=>false,
             :current_user_collections=>[],
             :sponsorship=>nil,
             :user=>
              {:id=>"t2RB-3lbgSk",
               :updated_at=>"2021-06-12T10:51:42-04:00",
               :username=>"rdehamer",
               :name=>"Ryan De Hamer", #using this one!
               :first_name=>"Ryan",
               :last_name=>"De Hamer",
               :twitter_username=>nil,
               :portfolio_url=>"http://www.dehamermedia.com",
               :bio=>"Lorem",
               :location=>nil,
               :links=>
                {:self=>"https://api.unsplash.com/users/rdehamer",
                 :html=>"https://unsplash.com/@rdehamer",
                 :photos=>"https://api.unsplash.com/users/rdehamer/photos",
                 :likes=>"https://api.unsplash.com/users/rdehamer/likes",
                 :portfolio=>"https://api.unsplash.com/users/rdehamer/portfolio",
                 :following=>"https://api.unsplash.com/users/rdehamer/following",
                 :followers=>"https://api.unsplash.com/users/rdehamer/followers"},
               :profile_backgroundpic=>
                {:small=>
                  "https://backgroundpics.unsplash.com/000",
                 :medium=>
                  "https://backgroundpics.unsplash.com/000",
                 :large=>
                  "https://backgroundpics.unsplash.com/000"},
               :instagram_username=>"Ryan_dehamer",
               :total_collections=>6,
               :total_likes=>0,
               :total_photos=>69,
               :accepted_tos=>true,
               :for_hire=>false},
             :tags=>
              []}
    query = "denver,co"

    backgroundpic = BackgroundPic.new(hash, query)
    expect(backgroundpic).to be_a BackgroundPic
    expect(backgroundpic.location).to eq(query)
    expect(backgroundpic.location).to be_a(String)
    expect(backgroundpic.backgroundpic_url).to eq("https://backgroundpics.unsplash.com/full_url")
    expect(backgroundpic.backgroundpic_url).to be_a(String)
    expect(backgroundpic.credit).to be_a(Hash)

    credit = backgroundpic.credit
    expect(credit.size).to eq(2)
    expect(credit).to have_key(:source)
    expect(credit).to have_key(:photographer)

    expect(credit[:source]).to eq("https://unsplash.com/photos/A4RpHR83luM")
    expect(credit[:photographer]).to eq("Ryan De Hamer")
  end
end

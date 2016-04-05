require 'spec_helper'
require 'rails_helper'

feature "goals" do
  let(:john) { FactoryGirl.create(:john) }
  let(:other_user) { FactoryGirl.create(:user) }

  before(:each) do
    visit new_session_url
    fill_in "Username", with: john.username
    fill_in "Password", with: john.password
    click_on "Log In"
    click_on "Create Goal"
    fill_in "Body", with: "I am a goal body"
    click_on "Submit"
  end

  feature "the creation process" do
    scenario "allows a logged in user to create a goal" do
      expect(page).to have_content("I am a goal body")
    end
  end

  feature "editing a goal" do
    scenario "when the goal is the user's" do
      click_on "I am a goal body"
      click_on "Edit Goal"
      fill_in "Body", with: "I am an edited body"
      click_on "Submit"

      expect(page).to have_content("I am an edited body")
    end

    scenario "fails when the goal is not the user's" do
      click_on "Sign Out"
      fill_in "Username", with: other_user.username
      fill_in "Password", with: other_user.password
      visit user_url(john)
      click_on "I am a goal body"
      expect(page).to_not have_content("Edit Goal")
    end

    feature "a user can toggle a goal's status" do
      let(:goal) {john.goals.first}

      scenario "when the goal is incomplete" do
        click_on "Mark as Complete"
        expect(goal.completed).to be true
      end

      scenario "when the goal is complete" do
        goal.completed = true
        goal.save!
        visit user_url(goal.user)
        click_on("Mark as Incomplete")
        expect(john.goals.first.completed).to be false
      end
    end
  end

  feature "destroying a goal" do
    scenario "when the goal is the user's" do

    end

    scenario "fails when the goal is not the user's" do

    end
  end
end

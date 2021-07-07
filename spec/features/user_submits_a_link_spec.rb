require 'rails_helper'

RSpec.feature "User Submits A Form" do

    scenario "they see the page for the submit link" do

        link_title = "This Testing Rails book is awesome!" 
        link_url = "http://testingrailsbook.com"
        visit root_path
        click_on "Submit a new link"

        fill_in "link_title", with: link_title 
        fill_in "link_url", with: link_url 
        
        click_on "Submit!"

        expect(page).to have_link link_title, href: link_url
    end
end


context "the form is invalid" do
    scenario "they see a useful error message" do
        link_title = "Thid testing is cool"

        visit root_path
        click_on "Submit a new link"
        fill_in "link_title",	with: link_title
        
        click_on "Submit!"

        puts "======= PAGE =======, #{page.has_content?}"

        expect(page).to have_content "url can't be blank"
    end    
end

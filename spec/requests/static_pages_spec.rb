require 'spec_helper'

describe "Static pages" do

  	describe "Log in" do

    		it "should have the content 'Registro'" do
      		visit '/static_pages/login'
      		expect(page).to have_content('Registro')
    		end
  	end

	describe "Registro" do

    		it "should have the content 'REGISTRO'" do
      		visit '/users/new'
      		expect(page).to have_content('REGISTRO')
    		end
  	end
	

end


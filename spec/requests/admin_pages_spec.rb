require 'spec_helper'

describe "AdminPages" do

	subject { page }
  
  describe "index" do
  	before { visit admin_path }

  	it { should have_selector('title', text: 'Admin') }
  end

  describe "galleries" do 
  	before { visit new_admin_gallery_path }

  	it { should have_selector('title', text: 'Admin') }
  end

  describe "news" do 
  	before do
  		visit new_admin_new_path
  		click_button "Ajouter"
  	end

  	it { should have_selector('title', text: 'Gdjkke WAY') }
  end

  describe "events" do
    before { visit new_admin_event_path }

    it { should have_selector('title', text: 'Gjsasda') }
  end
end

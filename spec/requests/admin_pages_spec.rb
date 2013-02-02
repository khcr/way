require 'spec_helper'

describe "AdminPages" do

	subject { page }
  
  describe "index" do
  	before { visit admins_path }

  	it { should have_selector('title', text: 'Admin') }
  end

  describe "galleries" do 
  	before { visit new_gallery_path }

  	it { should have_selector('title', text: 'Admin') }
  end

  describe "news" do 
  	before do
  		visit new_new_path
  		click_button "Ajouter"
  	end

  	it { should have_selector('title', text: 'Gdjkke WAY')}
  end
end

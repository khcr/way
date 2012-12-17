require 'spec_helper'

describe "Pages" do

	subject { page }
  
  describe "index" do
  	before { visit pages_path }

  	it { should have_selector('title', text: "Admin") }
  end 

  describe "home" do 
  	before { visit root_path }

  	it { should have_selector('title', text: "Acceuil") }
  end

  describe "vision" do 
  	before { visit vision_path }

  	it { should have_selector('title', text: "Vision") }
  end

  describe "edit" do 
    before { visit '/pages/1/edit' }

    it { should have_selector('title', text: "Admin") }
  end
end

require 'spec_helper'

describe "NewPages" do
  
  subject { page }

  describe "index" do 
  	before { visit news_path }

  	it { should have_selector('title', text: 'Admin') }
  end

  describe "new" do 
  	before { visit new_admin_new_path }

  	it { should have_selector('title', text: 'Admin') }
  end
end

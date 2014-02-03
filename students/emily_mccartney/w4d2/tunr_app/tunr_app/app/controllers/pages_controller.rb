class PagesController < ApplicationController
  def home    
  end

  def about_us
    @titlename = "About Us"
  end

  def contact_us
    @titlename = "Contact Us"
  end

  def privacy
    @titlename = "Privacy Statement"
  end

  def terms_and_conditions
    @titlename = "Terms and Conditions"
  end

end
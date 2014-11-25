require 'rails_helper'

module Tent
  RSpec.describe PagesController, :type => :controller do

    describe "GET show" do
      it "returns http success" do
        get :show
        expect(response).to have_http_status(:success)
      end
    end

  end
end

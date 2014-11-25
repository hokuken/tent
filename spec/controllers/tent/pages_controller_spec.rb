require 'rails_helper'

module Tent
  RSpec.describe PagesController, :type => :controller do
    routes { Tent::Engine.routes }

    let(:site) { create :tent_site }

    describe "GET show" do
      it "returns http success" do
        get :show, site_path: site.path
        expect(response).to have_http_status(:success)
      end

      it "HTMLに変換された page.body を持っている" do
        get :show, site_path: site.path
        expect(assigns[:body_html]).not_to be_nil
      end
    end

  end
end

require 'rails_helper'

module Tent
  RSpec.describe SitesController, :type => :controller do
    routes { Tent::Engine.routes }

    describe "GET index" do
      before do
        get :index
        @sites = Site.all
      end

      it "Sitesコントローラーを使っている" do
        expect(controller).to be_an_instance_of(SitesController)
      end

      it '/sites/index のリクエストに対するHTTPレスポンスのステータスコードは200' do
        expect(response).to be_success
      end

      it 'すべてのサイトを持っている' do
        expect(assigns[:sites].size).to be @sites.size
      end
    end

    describe "GET new" do
      before do
        get :new
      end
      
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "assigns a new Site to @site" do
        expect(assigns(:site)).to be_a_new(Site)
      end

      it "renders the :new template" do
        expect(response).to render_template :new
      end
    end

    describe "POST create" do

      context "with valid attributes" do
        it "creates a new site" do
          expect{
            post :create, site: FactoryGirl.attributes_for(:tent_site)
          }.to change(Site,:count).by(1)
        end

        it "redirects to the new group" do
          a = post :create, site: FactoryGirl.attributes_for(:tent_site)
          new_site = Site.unscoped.last
          expect(response).to redirect_to site_page_path(site_path: new_site.path)
        end
      end
 
      context "with invalid attributes" do
         it "does not save the new site" do
          expect{
            post :create, site: FactoryGirl.attributes_for(:tent_site_invalid)
          }.to_not change(Site,:count)
        end

        it "re-renders the new method" do
          post :create, site: FactoryGirl.attributes_for(:tent_site_invalid)
          expect(response).to render_template :new
        end
      end 
    end

  end
end

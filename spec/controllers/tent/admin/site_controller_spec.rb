require 'rails_helper'

module Tent

    RSpec.describe Admin::SiteController, :type => :controller do
      routes { Tent::Engine.routes }

      before do
        @site = create :tent_site
      end

      describe "GET configure" do
        before do
          get :configure, site_path: @site.path
        end

        it "returns http success" do
          expect(response).to have_http_status(:success)
        end

        it "assigns a site" do
          expect(assigns(:site)).to eq(@site)
        end

        it "renders the :configure template" do
          expect(response).to render_template :configure
        end
      end

      describe "PATCH configure_update" do
        before do
          @params = @site.attributes
          @params[:title] = 'あいうえお'
        end

        context "with valid attributes" do
          it "not create a site" do
            expect{
              patch :configure_update, site_path: @site.path, site: @params
            }.to_not change(Site,:count)
          end

          it "change site attribute" do
            patch :configure_update, site_path: @site.path, site: @params
            @site.reload
            expect(@site.title).to eq(@params[:title])
          end


          it "redirects to configure path" do
            patch :configure_update, site_path: @site.path, site: @params
            expect(response).to redirect_to admin_pitch_path(site_path: @site.path)
          end
        end

        context "with invalid attributes" do
           it "does not save site" do
            patch :configure_update, site_path: @site.path, site: FactoryGirl.attributes_for(:tent_site_invalid)
            @site.reload
            expect(@site.title).not_to eq(@params[:title])
          end

          it "re-renders the configure method" do
            patch :configure_update, site_path: @site.path, site: FactoryGirl.attributes_for(:tent_site_invalid)
            expect(response).to render_template :configure
          end
        end
      end
    end

end

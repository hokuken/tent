require 'rails_helper'

module Tent
  RSpec.describe PagesController, :type => :controller do
    routes { Tent::Engine.routes }

    let(:site) { create :tent_site }

    before { get :show, path: site.path }

    describe "GET show" do
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "HTMLに変換された page.body を持っている" do
        expect(assigns[:body_html]).not_to be_nil
      end

      it 'サイトがセットされている' do
        expect(assigns[:site]).to eq site
      end

      it 'インデックスページがセットされている' do
        expect(assigns[:page].path).to eq 'index'
      end

      it "show が render される" do
        expect(response).to render_template :show
      end

      context 'ページヘの訪問をする時' do
        let(:page) { create :tent_page, site_id: site.id }
        before { get :show, path: "#{site.path}/#{page.path}" }

        it "returns http success" do
          expect(response).to have_http_status(:success)
        end

        it "HTMLに変換された page.body を持っている" do
          expect(assigns[:body_html]).not_to be_nil
        end

        it 'サイトがセットされている' do
          expect(assigns[:site]).to eq site
        end

        it 'ページがセットされている' do
          expect(assigns[:page]).to eq page
        end
      end

      context "デフォルトサイトへの訪問をする時" do
        let(:default_site) do
          Site.default.first || create(:tent_site_default)
        end

        before do
          default_site
          get :show
        end

        it "デフォルトサイトがセットされている" do
          expect(assigns[:site]).to eq default_site
        end

        it "デフォルトサイトへの訪問ができる" do
          expect(response).to have_http_status(:success)
        end

        it 'インデックスページがセットされている' do
          expect(assigns[:page].path).to eq 'index'
        end

        context "ページヘアクセスする場合" do
          let(:page) { create :tent_page, site_id: default_site.id }

          before do
            get :show, path: page.path
          end

          it "デフォルトサイトがセットされている" do
            expect(assigns[:site]).to eq default_site
          end

          it "ページヘの訪問ができる" do
            expect(response).to have_http_status(:success)
          end

          it 'ページがセットされている' do
            expect(assigns[:page]).to eq page
          end
        end

      end
    end

  end
end

Tent::Engine.routes.draw do

  namespace :admin, path: '/:site_name/tent' do
    get '/' => 'tent#dashboard'
    get 'pitch' => 'tent#configure'
    get 'newpage' => 'pages#new'
    resources :pages, param: :page_path,
              only: [:index, :update, :create, :destroy],
              constraints: { page_path: /.+/ } do
      member do
        get '/', to: 'pages#edit', as: :edit
      end
    end
    resources :themes, only: [:index, :show, :destroy]
  end

  get '/:site_name/:page_path', to: 'pages#show',
      constraints: { site_name: /[^\/]+/, page_path: /.*/ }
end

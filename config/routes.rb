Tent::Engine.routes.draw do
  resources :sites, path: 'tents', only: [:index, :new, :create]

  namespace :admin, path: '/:site_path/tent' do
    get   '/'       => 'site#dashboard'
    get   'pitch'   => 'site#configure'
    patch 'pitch'   => 'site#configure_update'
    get   'newpage' => 'pages#new'
    resources :pages, param: :page_path,
              only: [:index, :update, :create, :destroy],
              constraints: { page_path: /.+/ } do
      member do
        get '/', to: 'pages#edit', as: :edit
      end
    end
    resources :themes, only: [:index, :show, :destroy]
  end

  get '/(:path)', to: 'pages#show',
      constraints: { path: /.*/ },
      as: :site_page
end

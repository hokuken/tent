Rails.application.routes.draw do
  root 'sites#index'

  mount Tent::Engine => "/"
end

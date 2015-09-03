Rails.application.routes.draw do
  root 'welcome#index'

  get 'search', to: 'search#index', as: 'search'

  resources 'words', only: [:show]
end

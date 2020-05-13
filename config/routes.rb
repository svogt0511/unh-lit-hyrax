Rails.application.routes.draw do
  mount Bulkrax::Engine, at: '/'
  post 'greetings/hello(.:format)'
  post 'greetings/hello_csv(.:format)'
  mount RailsAdmin::Engine => '/site_admin', as: 'rails_admin'
  mount Riiif::Engine => 'images', as: :riiif if Hyrax.config.iiif_image_server?
        mount BrowseEverything::Engine => '/browse'

  mount Zizia::Engine => '/'
  mount Blacklight::Engine => '/'

  concern :searchable, Blacklight::Routes::Searchable.new

  resource :catalog, only: [:index], as: 'catalog', path: '/catalog', controller: 'catalog' do
    concerns :searchable
  end

  devise_for :users
  mount Hydra::RoleManagement::Engine => '/'

  mount Qa::Engine => '/authorities'
  mount Hyrax::Engine, at: '/'
  resources :welcome, only: 'index'
  root 'hyrax/homepage#index'
  curation_concerns_basic_routes
  concern :exportable, Blacklight::Routes::Exportable.new

  resources :solr_documents, only: [:show], path: '/catalog', controller: 'catalog' do
    concerns :exportable
  end

  resources :bookmarks do
    concerns :exportable

    collection do
      delete 'clear'
    end
  end

  get 'importer_documentation/shared_folder', to: 'zizia/importer_documentation#shared_folder'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      scope 'brands' do
        get 'index', to: 'brands#index'
        get 'show/:id', to: 'brands#show'
        post 'create', to: 'brands#create'
        patch 'update/:id', to: 'brands#update'
        delete 'delete/:id', to: 'brands#delete'
      end
    end
  end
end

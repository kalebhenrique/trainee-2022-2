Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      scope 'brands' do
        get 'index', to: 'brands#index'
        get 'show/:id', to: 'genre#show'
      end
    end
  end
end

Asflash::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  scope "(:locale)", :locale => /ru|en/ do
    match 'portfolio', :to => 'section#portfolio'
    match 'section/(:id/(:page))', :to => 'sections#show', :as => 'section'
    match 'portfolio/(:id)', :to => 'portfolio#show', :as => 'portfolio'
    
    match 'pages/(:id)', :to => 'text_pages#show'
    match 'sitemap.xml' => 'sitemaps#sitemap'
    match "search/(:page)", :to => 'search#search_words'
    match "sitemap", :to => 'sitemap#index', :as => 'sitemap'
  
    root :to => 'sections#index'
    match 'not_found' => 'main_page#not_found', :as => 'not_found'
    match '*paths' => 'main_page#not_found'
  end
end

paths = {
  :root => {:url => "/", :dir => "", :alias => "root"},
  :root => {:url => "/", :dir => "", :alias => "root"},
  :home => {:url => "/home", :dir => "static_pages#home", :alias => "home"},
  :help => {:url => "/help", :dir => "static_pages#help", :alias => "help"},
  :contact => {:url => "/contact", :dir => "static_pages#contact", :alias => "contact"},
  :about => {:url => "/about", :dir => "static_pages#about", :alias => "about"},
  :sign_in => {:url => "/sign_in", :dir => "static_pages#sign_in", :alias => "sign_in"},
  :sign_up => {:url => "/sign_up", :dir => "static_pages#sign_up", :alias => "sign_up"},
}

Rails.application.routes.draw do
  get "users/new"
  root paths[:home][:dir], as: paths[:root][:alias]

  get paths[:home][:url], to: paths[:home][:dir], as: paths[:home][:alias]
  get paths[:help][:url], to: paths[:help][:dir] ,as: paths[:help][:alias]
  get paths[:contact][:url], to: paths[:contact][:dir], as: paths[:contact][:alias]
  get paths[:about][:url], to: paths[:about][:dir] ,as: paths[:about][:alias]
  get paths[:sign_in][:url], to: paths[:sign_in][:dir], as: paths[:sign_in][:alias]
  get paths[:sign_up][:url], to: paths[:sign_up][:dir], as: paths[:sign_up][:alias]


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"



end

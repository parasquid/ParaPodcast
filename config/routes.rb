Rails.application.routes.draw do
  root to: "app#index";
  get "app/feed"
end

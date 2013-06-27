Hackerforum::Application.routes.draw do
  get "/", controller: "questions", action: "index"

  get   "cadastre-se" => "signup#new"
  post  "cadastre-se" => "signup#create"

  get "entrar" => "login#new"
end

Hackerforum::Application.routes.draw do
  root to: "questions#index"

  get   "cadastre-se" => "signup#new", as: "signup"
  post  "cadastre-se" => "signup#create"

  get     "entrar" => "login#new", as: "login"
  post    "entrar" => "login#create", as: false
  delete  "sair"   => "login#destroy", as: "logout"

  get   "perguntar" => "questions#new", as: "new_question"
  post  "perguntar" => "questions#create", as: false
  get   "perguntas/:id" => "questions#show", as: "question"
end

Hackerforum::Application.routes.draw do
  root to: "questions#index"

  get   "cadastre-se" => "signup#new", as: "signup"
  post  "cadastre-se" => "signup#create"

  get     "entrar" => "login#new", as: "login"
  post    "entrar" => "login#create", as: false
  delete  "sair"   => "login#destroy", as: "logout"

  get   "perguntar" => "questions#new", as: "new_question"
  post  "perguntar" => "questions#create", as: false
  get   "perguntas/:id/feed" => "questions#feed", as: "question_feed", format: "xml"
  get   "perguntas/:id" => "questions#show", as: "question"

  post  "perguntas/:question_id/respostas" => "answers#create", as: "new_answer"

  get   "categorias/:id" => "categories#show", as: "category"

  get   "u/:id" => "users#path", as: "user"
end

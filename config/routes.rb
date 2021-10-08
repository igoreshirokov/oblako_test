Rails.application.routes.draw do
  

  #   GET /projects — вернуть все проекты с задачами;
  get "/projects", to: "project#index"
  # POST /todos — создать новую задачу;
  post "/todos", to: "todo#new"
  # PATCH /projects/id/todo/id — обновить задачу.
  patch "/projects/:projectid/todos/:todoid", to: "todo#edit"


end

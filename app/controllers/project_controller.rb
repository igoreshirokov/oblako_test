class ProjectController < ApplicationController
  def index
    @Projects = Project.all
    @Todos = Todo.all
    
    res = []
    for project in @Projects
      project_todos = []
      for todo in @Todos.select {|todo| todo.projectId == project.id}
        project_todos.push({
          id: todo.id,
          text: todo.text,
          isCompleted: todo.isCompleted
        })
      end
      res.push({
        id: project.id,
        title: project.title,
        todos: project_todos
      }) 
    end
    render json: res
  end
end

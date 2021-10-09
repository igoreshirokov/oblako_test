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

  def new     
    if !params[:title].blank?
      @title=params[:title]
      if !Project.exists?(@title)
        begin
          Project.create(title: @title)          
        rescue 
          render json: {status: 500, msg: 'Ошибка сервера. Проект не может быть создан!'}
        else
          render json: {status: 201, msg: 'Проект добавлен!'}
        end
      end
    end
  end

    
    # if !params[:text].blank?
    #   @text = params[:text]
    #   if !params[:projectId].blank?
    #     @projectId = params[:projectId]
    #     if Project.exists?(@projectId)
    #       begin
    #         Todo.create(
    #             text: @text,
    #             isCompleted: false,
    #             projectId: @projectId
    #           );
    #         rescue 
    #           render json: {status: 500, msg: 'Ошибка сервера. Запись не может быть создана!'}
    #         else
    #           render json: {status: 201, msg: 'Запись создана!'}
    #       end
    #     else
    #       render json: {status: 404, msg: 'Категории с ID [' + @projectId + '] не существует!'}
    #     end
    #   else
    #     render json: {status: 406, msg: 'Категория не указана!'}
    #   end
    # else
    #   render json: {status: 400, msg: 'Пустое поле задачи!'}
    # end


end

class TodoController < ApplicationController

  def new
    if !params[:text].blank?
      @text = params[:text]
      if !params[:projectId].blank?
        @projectId = params[:projectId]
        if Project.exists?(@projectId)
          begin
            Todo.create(
                text: @text,
                isCompleted: false,
                projectId: @projectId
              );
            rescue 
              render json: {status: 500, msg: 'Ошибка сервера. Запись не может быть создана!'}
            else
              render json: {status: 201, msg: 'Запись создана!'}
          end
        else
          render json: {status: 404, msg: 'Категории с ID [' + @projectId + '] не существует!'}
        end
      else
        render json: {status: 406, msg: 'Категория не указана!'}
      end
    else
      render json: {status: 400, msg: 'Пустое поле задачи!'}
    end
  end

  def edit
    @todoId = params[:todoid]
    @projectId = params[:projectid].to_i

    if Todo.exists?(@todoId)
      todo = Todo.find_by(id: @todoId)
      if todo.projectId == @projectId
        todo.update(isCompleted: !todo.isCompleted)
        render json: {status: 201, msg: 'Задача обновлена!', data: todo}
      else 
        render json: {status: 400, msg: 'Ошибка! Категория не соответствует задаче!'}
      end
      
    else
      render json: {status: 404, msg: 'Запись не найдена!'}
    end
  end

end
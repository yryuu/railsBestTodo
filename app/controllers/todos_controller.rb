class TodosController < ApplicationController
    def create
        user = getCurrentUser;
        @todo = user.todos.build(todo_params)
        if @todo.save
            flash[:success] = "登録を完了しました"
            redirect_to user
        else 
            flash[:warning] = "登録を失敗しました"
            redirect_to getCurrentUser;
        end
    end

    def destroy
        user = getCurrentUser
        todo = user.todos.find(params[:id])
        todo.destroy
        flash[:success] = "削除を完了しました"
        redirect_to user
    end

    private 
        def todo_params
            params.require(:todo).permit(:content)
        end
end

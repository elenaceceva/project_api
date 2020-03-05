
module Api
  module V1
    class TasksController < Api::V1::BaseController
      before_action :set_task, only: [:show, :update, :destroy]

      def_param_group :task do
        param :task, Hash, :desc => "Task info" do
          param :name, String, :desc => "Name for task" , :required => true
          param :content, String, :desc => "Content for task", :required => true
          param :state, Integer, :desc => "State for task"
        end
      end

      def index
        @tasks = Task.all
        authorize @tasks
        render json: @tasks
      end

      # GET /tasks/1
      api :GET, "/tasks/:id", "Show task "
      def show
        render json: @task
      end

      def new
        @task = Task.new
        authorize @task
      end

      # POST /tasks
      api :POST, "/tasks", "Create task "
      param_group :task
      def create
        @task = @task.new(task_params)
        @task.user = current_user
        authorize @task
        if @task.save
          render json: @task, status: :created, location: @task
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /tasks/1
      api :PUT, "/tasks/:id", "Update a task"
      param_group :task
      def update
        if @task.update(task_params)
          render json: @task
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      # DELETE /tasks/1
      def destroy
        @task.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_task
        @task = Task.find(params[:id])
        authorize @task
      end

      # Only allow a trusted parameter "white list" through.
      def task_params
        params.require(:task).permit(:user_id, :name, :content, :state)
      end
    end
  end
end

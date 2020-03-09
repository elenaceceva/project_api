
  class Api::V1::TasksController < BaseController
      before_action :set_task, only: [ :update, :destroy]

      def_param_group :task do
        param :task, Hash, :desc => "Task info" do
          param :name, String, :desc => "Name for task" , :required => true
          param :content, String, :desc => "Content for task", :required => true
          param :state, Integer, :desc => "State for task"
        end
      end
      api :GET, "/api/v1/users/:user_id/tasks", "Show all tasks "
      returns :array_of => :task, :code => 200, :desc => "All tasks"
      def index
        if(params.has_key? "user_id")
         @user = User.find(params[:user_id])
         @tasks = @user.tasks
          render json: @tasks
        else
          @tasks = Task.all
          render json: { status: 'SUCCESS', messsage:'Loaded posts', data: @tasks }
        end


      end

      # GET /tasks/1
      api :GET, "/api/v1/users/:user_id/tasks/:id", "Show task "
      returns :code => 200, :desc => "Detailed info about the tasks" do
        param_group :task
        property :name, String, :desc => "Name of a task"
      end
      def show
        @task = policy_scope(Task).find(params[:id])
        render json: @task
      end

      def new
        @task = Task.new
        authorize @task
      end

      # POST /tasks
      api :POST, "/api/v1/users", "Create task "
      param_group :task
      returns :code => 201, :desc => "Create task"
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
      api :PUT, "/api/v1/users/:id", "Update a task"
      param_group :task
      def update
        if @task.update(task_params)
          render json: @task
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      # DELETE /tasks/1
      api :DELETE, "/api/v1/users/:user_id/tasks/:id", "Delete a task"
      returns :code => 200, :desc => "Delete task"
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


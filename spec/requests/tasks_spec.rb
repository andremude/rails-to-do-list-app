require "rails_helper"

RSpec.describe TasksController, type: :controller do
  describe "GET #index" do
    it "assigns all tasks to @tasks" do
      task1 = Task.create(title: "Task 1", description: "Description 1")
      task2 = Task.create(title: "Task 2", description: "Description 2")

      get :index

      expect(assigns(:tasks)).to match_array([task1, task2])
    end

    it "renders the index template" do
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns the requested task to @task" do
      task = Task.create(title: "Task 1", description: "Description 1")

      get :show, params: { id: task.id }

      expect(assigns(:task)).to eq(task)
    end

    it "renders the show template" do
      task = Task.create(title: "Task 1", description: "Description 1")

      get :show, params: { id: task.id }

      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "assigns a new task to @task" do
      get :new

      expect(assigns(:task)).to be_a_new(Task)
    end

    it "renders the new template" do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "assigns the requested task to @task" do
      task = Task.create(title: "Task 1", description: "Description 1")

      get :edit, params: { id: task.id }

      expect(assigns(:task)).to eq(task)
    end

    it "renders the edit template" do
      task = Task.create(title: "Task 1", description: "Description 1")

      get :edit, params: { id: task.id }

      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new task" do
        expect {
          post :create, params: { task: { title: "Task 1", description: "Description 1" } }
        }.to change(Task, :count).by(1)
      end

      it "redirects to the tasks index" do
        post :create, params: { task: { title: "Task 1", description: "Description 1" } }

        expect(response).to redirect_to(tasks_url)
      end
    end

    context "with invalid params" do
      it "does not create a new task" do
        expect {
          post :create, params: { task: { title: nil, description: "Description 1" } }
        }.to_not change(Task, :count)
      end

      it "renders the new template" do
        post :create, params: { task: { title: nil, description: "Description 1" } }

        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH #update" do
    let(:task) { Task.create(title: "Task 1", description: "Description 1") }

    context "with valid params" do
      it "updates the requested task" do
        patch :update, params: { id: task.id, task: { title: "Updated Task", description: "Updated Description" } }
        task.reload
        expect(task.title).to eq("Updated Task")
        expect(task.description).to eq("Updated Description")
      end

      it "redirects to the tasks index" do
        patch :update, params: { id: task.id, task: { title: "Updated Task", description: "Updated Description" } }
        expect(response).to redirect_to(tasks_url)
      end
    end

    context "with invalid params" do
      it "does not update the requested task" do
        patch :update, params: { id: task.id, task: { title: nil, description: "Updated Description" } }
        task.reload
        expect(task.title).to eq("Task 1")
        expect(task.description).to eq("Description 1")
      end

      it "renders the edit template" do
        patch :update, params: { id: task.id, task: { title: nil, description: "Updated Description" } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:task) { Task.create(title: "Task 1", description: "Description 1") }

    it "destroys the requested task" do
      expect {
        delete :destroy, params: { id: task.id }
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks index" do
      delete :destroy, params: { id: task.id }
      expect(response).to redirect_to(tasks_url)
    end
  end
end

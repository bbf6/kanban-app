import { defineStore } from 'pinia'

const getNewTask = () => ({
  title: '',
  description: ''
})

export const useTaskStore = defineStore('task', {
  state: () => ({
    showTaskForm: false,
    listSelected: 0,
    movingTaskId: null,
    newTask: getNewTask(),
    todoList: [
      { id: 1, index: 1, isDroping: false, title: 'Setup Project', description: 'Initialize the project repository and setup the project structure' },
      { id: 2, index: 2, isDroping: false, title: 'Design Mockups', description: 'Create design mockups for the main pages' },
      { id: 3, index: 3, isDroping: false, title: 'Create Wireframes', description: 'Design wireframes for the user interface' },
      { id: 4, index: 4, isDroping: false, title: 'Write Documentation', description: 'Prepare the project documentation and guidelines' },
      { id: 5, index: 5, isDroping: false, title: 'Plan Sprint', description: 'Organize tasks and set goals for the upcoming sprint' },
      { id: 6, index: 6, isDroping: false, title: 'Define User Stories', description: 'Write user stories for the initial features' }
    ],
    doingList: [
      { id: 7, index: 1, isDroping: false, title: 'Develop Homepage', description: 'Code the homepage using HTML, CSS, and JavaScript' },
      { id: 8, index: 2, isDroping: false, title: 'User Authentication', description: 'Implement user authentication system with login and registration' },
      { id: 9, index: 3, isDroping: false, title: 'Create Database Schema', description: 'Design and create the database schema' },
      { id: 10, index: 4, isDroping: false, title: 'Set Up CI/CD Pipeline', description: 'Configure continuous integration and deployment pipeline' },
      { id: 11, index: 5, isDroping: false, title: 'API Development', description: 'Develop RESTful API endpoints for the application' }
    ],
    doneList: [
      { id: 12, index: 1, title: 'Research Requirements', description: 'Gather and document project requirements' },
      { id: 13, index: 2, title: 'Create Project Plan', description: 'Develop a project plan with milestones and deadlines' },
      { id: 14, index: 3, title: 'Conduct Initial Meeting', description: 'Hold the first meeting with the project team to discuss objectives' },
      { id: 15, index: 4, title: 'Choose Tech Stack', description: 'Decide on the technology stack to be used for the project' },
      { id: 16, index: 5, title: 'Set Up Development Environment', description: 'Prepare the development environment for all team members' },
      { id: 17, index: 6, title: 'Design Logo', description: 'Create the logo for the project' }
    ]
  }),
  getters: {},
  actions: {
    closeForm() {
      this.showTaskForm = false
      this.newTask = getNewTask()
    },
    addTask() {
      let list = this.todoList
      if (this.listSelected === 2) list = this.doingList
      if (this.listSelected === 3) list = this.doneList
      list.push(this.newTask)
      this.closeForm()
    },
    moveTask(taskPlaceId) {
      console.log(`moving task ${this.movingTaskId} to ${taskPlaceId}`)
    }
  }
})

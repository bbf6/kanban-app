import { defineStore } from 'pinia'

const getNewTask = () => ({
  title: '',
  description: ''
})

export const useTaskStore = defineStore('task', {
  state: () => ({
    showTaskForm: false,
    listSelected: 0,
    newTask: getNewTask(),
    todoList: [
      { title: 'Setup Project', description: 'Initialize the project repository and setup the project structure' },
      { title: 'Design Mockups', description: 'Create design mockups for the main pages' },
      { title: 'Create Wireframes', description: 'Design wireframes for the user interface' },
      { title: 'Write Documentation', description: 'Prepare the project documentation and guidelines' },
      { title: 'Plan Sprint', description: 'Organize tasks and set goals for the upcoming sprint' },
      { title: 'Define User Stories', description: 'Write user stories for the initial features' }
    ],
    doingList: [
      { title: 'Develop Homepage', description: 'Code the homepage using HTML, CSS, and JavaScript' },
      { title: 'User Authentication', description: 'Implement user authentication system with login and registration' },
      { title: 'Create Database Schema', description: 'Design and create the database schema' },
      { title: 'Set Up CI/CD Pipeline', description: 'Configure continuous integration and deployment pipeline' },
      { title: 'API Development', description: 'Develop RESTful API endpoints for the application' }
    ],
    doneList: [
      { title: 'Research Requirements', description: 'Gather and document project requirements' },
      { title: 'Create Project Plan', description: 'Develop a project plan with milestones and deadlines' },
      { title: 'Conduct Initial Meeting', description: 'Hold the first meeting with the project team to discuss objectives' },
      { title: 'Choose Tech Stack', description: 'Decide on the technology stack to be used for the project' },
      { title: 'Set Up Development Environment', description: 'Prepare the development environment for all team members' },
      { title: 'Design Logo', description: 'Create the logo for the project' }
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
    }
  }
})

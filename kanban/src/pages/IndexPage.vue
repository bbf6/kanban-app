<template lang="pug">
q-page.q-pa-xl(bg-color="bg-color")
  label.title="Kanban"
  #board
    card-list(title="To do" :tasks="taskStore.todoList"  :id="1")
    card-list(title="Doing" :tasks="taskStore.doingList" :id="2")
    card-list(title="Done"  :tasks="taskStore.doneList"  :id="3")
  q-dialog(v-model="taskStore.showTaskForm")
    task-form
</template>

<script setup>
import { useTaskStore } from 'src/stores/task'
import CardList from 'src/components/CardList'
import TaskForm from 'src/components/task/TaskForm'

const taskStore = useTaskStore()
</script>

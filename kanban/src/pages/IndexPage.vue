<template lang="pug">
q-page#board.q-pa-xl
  card-list(title="to do" :tasks="taskStore.todoList"  :id="1")
  card-list(title="doing" :tasks="taskStore.doingList" :id="2")
  card-list(title="done"  :tasks="taskStore.doneList"  :id="3")
  q-dialog(v-model="taskStore.showTaskForm")
    task-form
</template>

<script setup>
import { useTaskStore } from 'src/stores/task'
import CardList from 'src/components/CardList'
import TaskForm from 'src/components/task/TaskForm'

const taskStore = useTaskStore()
</script>

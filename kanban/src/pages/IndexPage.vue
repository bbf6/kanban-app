<template lang="pug">
q-page#board.q-pa-xl
  card-list(title="to do", :tasks="taskStore.todoList")
  card-list(title="doing", :tasks="taskStore.doingList")
  card-list(title="done", :tasks="taskStore.doneList")
</template>

<script setup>
import { useTaskStore } from 'src/stores/task'
import CardList from 'src/components/CardList'

const taskStore = useTaskStore()
</script>

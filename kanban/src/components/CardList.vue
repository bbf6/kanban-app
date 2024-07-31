<template lang="pug">
q-card.list
  q-card-section
    label="{{ props.title }}"
  q-card-section
    ul
      li(v-for="task in props.tasks")
        card-task(:task="task")
  q-card-section
    .flex
      q-btn.bg-primary.text-white(
        no-caps
        label="Add Task"
        icon="add"
        @click="openForm"
      )
</template>

<script setup>
import { useTaskStore } from 'src/stores/task'
import CardTask from 'src/components/CardTask'

const taskStore = useTaskStore()

const props = defineProps({
  id: Number,
  title: String,
  tasks: Array
})

const openForm = () => {
  taskStore.listSelected = props.id
  taskStore.showTaskForm = true
}
</script>

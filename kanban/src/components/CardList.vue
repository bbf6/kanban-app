<template lang="pug">
q-card.list
  q-card-section
    label="{{ props.title }}"
  q-card-section
    ul
      li(
        v-for="task in props.tasks"
        :class="{ 'considering-dropping': task.isDroping }"
        @dragover.prevent="() => dragOver(task)"
        @dragenter.prevent="() => dragEnter(task)"
        @dragleave="() => dragLeave(task)"
        @drop="() => drop(task)"
      )
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

const dragOver = task => task.isDroping = true
const dragEnter = task => task.isDroping = true
const dragLeave = task => task.isDroping = false
const drop = task => taskStore.moveTask(task.id)

const openForm = () => {
  taskStore.listSelected = props.id
  taskStore.showTaskForm = true
}
</script>

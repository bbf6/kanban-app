<template lang="pug">
q-card.task(
  draggable="true"
  @dragstart="dragStart"
  @dragend="dragEnd"
)
  q-card-section
    label="{{ props.task.title }}"
  q-card-section
    label="{{ props.task.description }}"
</template>

<script setup>
import { useTaskStore } from 'src/stores/task'

const taskStore = useTaskStore()

const props = defineProps({
  task: Object
})

const dragStart = event => taskStore.movingTaskId = props.task.id

const dragEnd = event => taskStore.movingTaskId = null
</script>

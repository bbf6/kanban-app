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
      q-btn.bg-primary.text-white(no-caps label="Add Task" icon="add")
</template>

<script setup>
import CardTask from 'src/components/CardTask'

const props = defineProps({
  title: String,
  tasks: Array
})
</script>

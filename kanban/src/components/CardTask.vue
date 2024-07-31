<template lang="pug">
q-card.task
  q-card-section
    label="{{ props.task.title }}"
  q-card-section
    label="{{ props.task.description }}"
</template>

<script setup>
const props = defineProps({
  task: Object
})
</script>

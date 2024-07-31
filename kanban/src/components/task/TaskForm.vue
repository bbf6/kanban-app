<template lang="pug">
q-card#new-form
  q-card-section.flex
    label="New Task"
    q-icon(name="close" @click="taskStore.closeForm")
  q-card-section
    q-input(
      label="Title"
      autofocus
      v-model="taskStore.newTask.title"
    )
    q-input(
      label="Description"
      multi-line
      v-model="taskStore.newTask.description"
    )
  q-card-section
    q-btn.bg-primary.text-white(
      label="Save"
      icon="save"
      @click="taskStore.addTask"
    )
</template>

<script setup>
import { useTaskStore } from 'src/stores/task'

const taskStore = useTaskStore()
</script>

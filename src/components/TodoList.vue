<script setup lang="ts">
import { Todo } from '../types/todo'
import TodoItem from './TodoItem.vue'

const props = defineProps<{
  todos: Todo[]
}>()

const emit = defineEmits<{
  toggle: [id: string]
  delete: [id: string]
  edit: [id: string, newText: string]
}>()

const handleToggle = (id: string) => {
  emit('toggle', id)
}

const handleDelete = (id: string) => {
  emit('delete', id)
}

const handleEdit = (id: string, newText: string) => {
  emit('edit', id, newText)
}
</script>

<template>
  <ul class="todo-list">
    <TodoItem
      v-for="todo in props.todos"
      :key="todo.id"
      :todo="todo"
      @toggle="handleToggle"
      @delete="handleDelete"
      @edit="handleEdit"
    />
    <li v-if="props.todos.length === 0" class="empty-message">暂无待办事项，添加一个吧！📝</li>
  </ul>
</template>

<style scoped>
.todo-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.empty-message {
  text-align: center;
  padding: 20px;
  color: #999;
}
</style>

<script setup lang="ts">
import { ref } from 'vue'
import { useTodos } from './composables/useTodos'
import TodoList from './components/TodoList.vue'
import TodoFilter from './components/TodoFilter.vue'

const {
  filteredTodos,
  activeCount,
  hasCompleted,
  filter,
  addTodo,
  toggleTodo,
  deleteTodo,
  editTodo,
  clearCompleted,
  setFilter
} = useTodos()

const newTodoText = ref('')

const handleAddTodo = () => {
  if (newTodoText.value.trim()) {
    addTodo(newTodoText.value)
    newTodoText.value = ''
  }
}
</script>

<template>
  <div class="app-container">
    <h1>Vue 3 Todo App</h1>

    <div class="input-group">
      <input
        v-model="newTodoText"
        @keyup.enter="handleAddTodo"
        placeholder="添加新的待办事项..."
        class="todo-input"
      />
      <button @click="handleAddTodo" class="btn-add">添加</button>
    </div>

    <TodoList
      :todos="filteredTodos"
      @toggle="toggleTodo"
      @delete="deleteTodo"
      @edit="editTodo"
    />

    <TodoFilter
      :current-filter="filter"
      :active-count="activeCount"
      :has-completed="hasCompleted"
      @set-filter="setFilter"
      @clear-completed="clearCompleted"
    />
  </div>
</template>

<style>
/* 全局样式 */
body {
  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
  background-color: #f5f5f5;
  margin: 0;
  padding: 20px;
}

.app-container {
  max-width: 600px;
  margin: 0 auto;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  padding: 20px;
}

h1 {
  text-align: center;
  color: #42b983;
}

.input-group {
  display: flex;
  gap: 10px;
  margin-bottom: 20px;
}

.todo-input {
  flex: 1;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ddd;
  border-radius: 4px;
  outline: none;
}

.todo-input:focus {
  border-color: #42b983;
}

.btn-add {
  padding: 10px 20px;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
}

.btn-add:hover {
  background-color: #3aa876;
}
</style>

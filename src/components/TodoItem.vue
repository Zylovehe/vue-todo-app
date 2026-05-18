<script setup lang="ts">
import { ref, nextTick } from 'vue'
import { Todo } from '../types/todo'

const props = defineProps<{
  todo: Todo
}>()

const emit = defineEmits<{
  toggle: [id: string]
  delete: [id: string]
  edit: [id: string, newText: string]
}>()

const isEditing = ref(false)
const editText = ref(props.todo.text)
const inputRef = ref<HTMLInputElement | null>(null)

const handleToggle = () => {
  emit('toggle', props.todo.id)
}

const handleDelete = () => {
  emit('delete', props.todo.id)
}

const startEdit = async () => {
  isEditing.value = true
  await nextTick()
  inputRef.value?.focus()
}

const saveEdit = () => {
  if (editText.value.trim()) {
    emit('edit', props.todo.id, editText.value)
  } else {
    editText.value = props.todo.text // 恢复原值
  }
  isEditing.value = false
}

const cancelEdit = () => {
  editText.value = props.todo.text
  isEditing.value = false
}
</script>

<template>
  <li :class="['todo-item', { completed: todo.completed }]">
    <div class="todo-content">
      <input
        type="checkbox"
        :checked="todo.completed"
        @change="handleToggle"
        class="todo-checkbox"
      />

      <span v-if="!isEditing" @dblclick="startEdit" class="todo-text">
        {{ todo.text }}
      </span>

      <input
        v-else
        ref="inputRef"
        v-model="editText"
        @blur="saveEdit"
        @keyup.enter="saveEdit"
        @keyup.escape="cancelEdit"
        class="todo-edit-input"
      />
    </div>

    <div class="todo-actions">
      <button @click="startEdit" class="btn-icon" title="编辑">✏️</button>
      <button @click="handleDelete" class="btn-icon btn-delete" title="删除">🗑️</button>
    </div>
  </li>
</template>

<style scoped>
.todo-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px;
  border-bottom: 1px solid #eee;
  transition: background-color 0.2s;
}

.todo-item:hover {
  background-color: #f9f9f9;
}

.todo-content {
  display: flex;
  align-items: center;
  gap: 10px;
  flex: 1;
}

.todo-text {
  cursor: pointer;
  word-break: break-all;
}

.completed .todo-text {
  text-decoration: line-through;
  color: #888;
}

.todo-edit-input {
  flex: 1;
  padding: 4px;
  font-size: 16px;
  border: 1px solid #ddd;
  border-radius: 4px;
}

.todo-actions {
  display: flex;
  gap: 8px;
  opacity: 0.6;
}

.todo-item:hover .todo-actions {
  opacity: 1;
}

.btn-icon {
  background: none;
  border: none;
  cursor: pointer;
  font-size: 16px;
  padding: 4px;
}

.btn-delete:hover {
  color: red;
}
</style>

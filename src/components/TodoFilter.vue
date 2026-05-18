<script setup lang="ts">
import { FilterType } from '../types/todo'

defineProps<{
  currentFilter: FilterType
  activeCount: number
  hasCompleted: boolean
}>()

defineEmits<{
  setFilter: [filter: FilterType]
  clearCompleted: []
}>()
</script>

<template>
  <div class="todo-footer">
    <span class="items-left"> {{ activeCount }} 项未完成 </span>

    <div class="filters">
      <button
        :class="{ active: currentFilter === 'all' }"
        @click="$emit('setFilter', 'all')"
      >
        全部
      </button>
      <button
        :class="{ active: currentFilter === 'active' }"
        @click="$emit('setFilter', 'active')"
      >
        进行中
      </button>
      <button
        :class="{ active: currentFilter === 'completed' }"
        @click="$emit('setFilter', 'completed')"
      >
        已完成
      </button>
    </div>

    <button v-if="hasCompleted" @click="$emit('clearCompleted')" class="btn-clear">
      清除已完成
    </button>
  </div>
</template>

<style scoped>
.todo-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-top: 15px;
  border-top: 1px solid #eee;
  font-size: 14px;
  color: #666;
  flex-wrap: wrap;
  gap: 10px;
}

.filters {
  display: flex;
  gap: 5px;
}

.filters button {
  background: none;
  border: 1px solid transparent;
  cursor: pointer;
  padding: 4px 8px;
  border-radius: 4px;
  color: #666;
}

.filters button.active {
  border-color: #42b983;
  color: #42b983;
  font-weight: bold;
}

.btn-clear {
  background: none;
  border: none;
  cursor: pointer;
  color: #666;
  text-decoration: underline;
}

.btn-clear:hover {
  color: #333;
}
</style>

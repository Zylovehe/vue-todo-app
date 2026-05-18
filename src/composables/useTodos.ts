import { ref, computed, watch } from 'vue'
import { Todo, FilterType } from '../types/todo'

// 从 localStorage 加载初始数据
const loadTodos = (): Todo[] => {
  const saved = localStorage.getItem('vue-todos')
  return saved ? JSON.parse(saved) : []
}

export function useTodos() {
  const todos = ref<Todo[]>(loadTodos())
  const filter = ref<FilterType>('all')

  // 持久化：当 todos 变化时自动保存
  watch(
    todos,
    (newVal) => {
      localStorage.setItem('vue-todos', JSON.stringify(newVal))
    },
    { deep: true }
  )

  // 添加待办
  const addTodo = (text: string) => {
    if (!text.trim()) return
    const newTodo: Todo = {
      id: crypto.randomUUID(),
      text: text.trim(),
      completed: false,
      createdAt: Date.now()
    }
    todos.value.unshift(newTodo) // 添加到头部
  }

  // 切换完成状态
  const toggleTodo = (id: string) => {
    const todo = todos.value.find((t) => t.id === id)
    if (todo) {
      todo.completed = !todo.completed
    }
  }

  // 删除待办
  const deleteTodo = (id: string) => {
    todos.value = todos.value.filter((t) => t.id !== id)
  }

  // 编辑待办
  const editTodo = (id: string, newText: string) => {
    const todo = todos.value.find((t) => t.id === id)
    if (todo && newText.trim()) {
      todo.text = newText.trim()
    }
  }

  // 清除已完成
  const clearCompleted = () => {
    todos.value = todos.value.filter((t) => !t.completed)
  }

  // 计算属性：过滤后的列表
  const filteredTodos = computed(() => {
    if (filter.value === 'active') return todos.value.filter((t) => !t.completed)
    if (filter.value === 'completed') return todos.value.filter((t) => t.completed)
    return todos.value
  })

  // 计算属性：剩余未完成数量
  const activeCount = computed(() => todos.value.filter((t) => !t.completed).length)

  // 计算属性：是否有已完成的
  const hasCompleted = computed(() => todos.value.some((t) => t.completed))

  // 设置过滤器
  const setFilter = (newFilter: FilterType) => {
    filter.value = newFilter
  }

  return {
    todos,
    filter,
    filteredTodos,
    activeCount,
    hasCompleted,
    addTodo,
    toggleTodo,
    deleteTodo,
    editTodo,
    clearCompleted,
    setFilter
  }
}

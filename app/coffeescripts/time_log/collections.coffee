# COLLECTIONS

class Tasks extends Backbone.Collection
  model: app.Task
  url: '/api/tasks'
  comparator: (task) ->
    task.get('createdAt')
  completedTasks: ->
    tasks = @filter (task) ->
      task.isCompleted()
    _.sortBy tasks, (task) ->
      task.get('completedAt')
  incompleteTasks: ->
    @reject (task) ->
      task.isCompleted()
  


@app = window.app ? {}
@app.Tasks = new Tasks


###
Todo.sort()
###

class @Todo

  @_storage: []
  @_idCounter: 0

  constructor: (@name, @completed = false)->
    @id = Todo.generateID()
    Todo._storage.unshift @
    Todo.sort()

  @all: -> Todo._storage

  @generateID: -> @_idCounter++

  @find: (id) ->
    (t for t, index in Todo.all() when t.id is id)[0]

  @select: (iterator) -> (t for t in Todo.all() when iterator(t))

  @sort: ->
    Todo._storage.sort (a, b) ->
      if a.completed is b.completed then 0
      else if a.completed < b.completed then 1
      else -1

  complete: -> @completed = true

  destroy: ->
    Todo._storage = (index for t, index in Todo.all() when t.id isnt @id)
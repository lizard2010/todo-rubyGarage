@todo.controller 'PrjShowCtrl',  ['$scope', '$routeParams', '$location', '$http', ($scope, $routeParams, $location, $http) ->
  $scope.tasks = []
  $http.get('./users/tasks/'+ $routeParams.id + '.json').success((data) ->
    $scope.tasks = data
  )
  $http.get('./users/projects/'+ $routeParams.id + '.json').success((data) ->
    $scope.project = data
  )
  $scope.user1 = {
    dob: new Date(1984, 4, 15)
  };

  $scope.addTask = (task) ->
    $http({
      method: 'POST',
      url: "/tasks/" + task.project_id + ".json",
      data: $.param({task: task}),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    }).success((data) ->
      $scope.tasks.push(data)
    )

  $scope.viewTask = (id) ->
    $location.url "/tasks/#{id}"


  $scope.updateTask = (data, idx) ->
    #url = ['/tasks/' ,  $scope.project.id ,  '/' ,  $scope.tasks[idx].task_id, '.json'].join('')
    $http.put( '/tasks/' + $scope.tasks[idx].id + '.json', {task: {name: data, project_id: $scope.tasks[idx].project_id}}).success((data) ->
      $scope.task[idx] = data
    )
    true

  $scope.delTask = (pid, idx) ->
    task_to_delete = $scope.tasks[idx];
    confirm_text = "Remove '" + task_to_delete.name + "' ?"
    if confirm(confirm_text)
      url = ["", "tasks", pid, task_to_delete.id ].join('/')+'.json'
      $http.delete(url).success((data) ->
        $scope.tasks.splice(idx, 1);
      )
    true
]
@todo.controller 'PrjShowCtrl', ['$scope', '$routeParams', '$http', ($scope, $routeParams, $http) ->
  $scope.tasks = []
  $http.get('./users/tasks/'+ $routeParams.id + '.json').success((data) ->
    $scope.tasks = data
  )
  $http.get('./users/projects/'+ $routeParams.id + '.json').success((data) ->
    $scope.project = data
  )

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

]
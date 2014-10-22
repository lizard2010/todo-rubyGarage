@todo.controller 'TaskIndexCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.tasks = []
  $http.get('./tasks.json').success((data) ->
    $scope.tasks = data
  )

  $scope.viewTask = (id) ->
    $location.url "/tasks/#{id}"
]
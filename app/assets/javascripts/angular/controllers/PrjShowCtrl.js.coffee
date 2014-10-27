@todo.controller 'PrjShowCtrl', ['$scope', '$routeParams', '$http', ($scope, $routeParams, $http) ->
  $scope.tasks = []
  $http.get('./users/tasks/'+ $routeParams.id + '.json').success((data) ->
    $scope.tasks = data
  )
  $http.get('./users/projects/'+ $routeParams.id + '.json').success((data) ->
    $scope.project = data
  )
  $scope.viewTask = (id) ->
    $location.url "/tasks/#{id}"
]
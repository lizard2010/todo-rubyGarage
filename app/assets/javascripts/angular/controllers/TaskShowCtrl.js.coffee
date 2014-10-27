@todo.controller 'TaskShowCtrl', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http.get("./tasks/#{$routeParams.id}.json").success((data) ->
    $scope.task = data
    $http.get("./users/projects/#{data.project_id}.json").success((data) ->
      $scope.project = data
    )

  )
]

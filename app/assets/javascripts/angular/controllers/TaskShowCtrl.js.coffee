@todo.controller 'TaskShowCtrl', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http.get("./tasks/#{$routeParams.id}.json").success((data) ->
    $scope.task = data
  )
]
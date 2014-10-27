@todo.controller 'PrjIndexCtrl', ['$scope', '$location', '$http', '$rootScope', ($scope, $location, $http, $rootScope) ->
  $scope.prjs = []
  $http.get('./users/projects.json').success((data) ->
    $scope.prjs = data
  )
]
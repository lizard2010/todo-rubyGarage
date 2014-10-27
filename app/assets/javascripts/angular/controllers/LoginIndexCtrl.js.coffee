@todo.controller 'LoginIndexCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.gosignup = () ->
    $location.url "/signup"
]
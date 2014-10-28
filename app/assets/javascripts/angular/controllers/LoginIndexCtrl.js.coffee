@todo.controller 'LoginIndexCtrl', ['$scope', '$location', '$http', '$rootScope', ($scope, $location, $http, $rootScope) ->
# Current user init
  $http.get('./users/current.json').success((data) ->
    $rootScope.current_user = data
# if success - we logged in
    if data.id
      $location.url "/projects"
  )

  $scope.login = (user) ->
    $http({
      method: 'POST',
      url: "/users/login.json",
      data: $.param({user: user}),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    }).success((data) ->
      $rootScope.currentUser = data
      if(data.id)
        $location.url "/projects"
    )


  $scope.gosignup = () ->
    $location.url "/signup"
]
@todo.controller 'LoginSignUpCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->

  $scope.signup =  (login_user) ->
    $scope.master = angular.copy(login_user)
    #alert(login_user)
    login_user.provider='todo'
    login_user.uid=0
    $http({
        method: 'POST',
        url: "/users.json",
        data: $.param({user: login_user}),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    })
  $scope.gologin = () ->
    $location.url "/login"
]

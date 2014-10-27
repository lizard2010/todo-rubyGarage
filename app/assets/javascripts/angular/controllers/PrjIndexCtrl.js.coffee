@todo.controller 'PrjIndexCtrl', ['$scope', '$location', '$http', '$rootScope', ($scope, $location, $http, $rootScope) ->
  $scope.prjs = []
  $http.get('./users/projects.json').success((data) ->
    $scope.prjs = data
  )
  $scope.addPrj = (prj) ->
    $http({
      method: 'POST',
      url: "/projects.json",
      data: $.param({project: prj}),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    }).success((data) ->
      $scope.prjs.push(data)
    )

  $scope.delPrj = (idx) ->
    pri_to_delete = $scope.prjs[idx];
    if confirm("Remove '"+pri_to_delete.name+"'?")
      $http({
        method: 'DELETE',
        url: "/projects/" + pri_to_delete.id + '.json',
      }).success((data) ->
        $scope.prjs.splice(idx, 1);
      )

  $scope.viewPrj = (id) ->
#    $location.url "/projects/#{id}"

]


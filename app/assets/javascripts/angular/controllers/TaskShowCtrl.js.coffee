@todo.controller 'TaskShowCtrl', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http.get("./tasks/#{$routeParams.id}.json").success((data) ->
    $scope.task = data
    $scope.comments = data.comments
    $http.get("./users/projects/#{data.project_id}.json").success((data) ->
      $scope.project = data
    )
    $http.get("./comments/#{data.project_id}/#{$routeParams.id}.json").success((data) ->
      $scope.comments = data
    )

  )

  $scope.addComment = (comm, pid) ->
    $http({
      method: 'POST',
      url: "/comments.json",
      data: $.param({comment: comm, pid: pid}),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    }).success((data) ->
      $scope.comments.push(data)
    )

  $scope.delComment = (idx) ->
    comm_to_delete = $scope.comments[idx];
    if confirm("Remove '" + comm_to_delete.name+"'?")
      $http({
        method: 'DELETE',
        url: "/comments/" + comm_to_delete.id + '.json',
      }).success((data) ->
        $scope.comments.splice(idx, 1);
      )

]

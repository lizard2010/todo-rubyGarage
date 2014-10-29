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

  $scope.delComm = (pid, tid, idx) ->
    comm_to_delete = $scope.comments[idx];
    confirm_text = "Remove '" + comm_to_delete.text + "' ?"
    if confirm(confirm_text)
      url = ["", "comments", pid, tid,  comm_to_delete.id ].join('/')
      $http({
        method: 'DELETE',
        url: url + '.json',
      }).success((data) ->
        $scope.comments.splice(idx, 1);
      )

  $scope.updateComment = (data, idx) ->
    url = ['/comments/' ,  $scope.project.id ,  '/' ,  $scope.comments[idx].task_id, '.json'].join('')
    $http.put(url , {id: $scope.comments[idx].id, comment: {text: data}}).success((data) ->
        $scope.comments[idx] = data
    )
    true
]

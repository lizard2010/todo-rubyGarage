# app/assets/javascripts/main.js.coffee

# This line is related to our Angular app, not to our
# HomeCtrl specifically. This is basically how we tell
# Angular about the existence of our application.
@todo = angular.module('todo', ['ngRoute'])

# This routing directive tells Angular about the default
# route for our application. The term "otherwise" here
# might seem somewhat awkward, but it will make more
# sense as we add more routes to our application.
@todo.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/tasks', {
      templateUrl: '../templates/tasks/index.html',
      controller: 'TaskIndexCtrl'
    }).
    when('/login', {
      templateUrl: '../templates/login/index.html',
      controller: 'LoginIndexCtrl'
    }).
    when('/signup', {
      templateUrl: '../templates/login/sign-up.html',
      controller: 'LoginSignUpCtrl'
    }).
    when('/tasks', {
      templateUrl: '../templates/tasks/index.html',
      controller: 'TaskIndexCtrl'
    }).
    when('/tasks/:id', {
      templateUrl: '../templates/tasks/show.html',
      controller: 'TaskShowCtrl'
    }).
    when('/projects', {
      templateUrl: '../templates/projects/index.html',
      controller: 'PrjIndexCtrl'
    }).
    when('/projects/:id', {
      templateUrl: '../templates/projects/show.html',
      controller: 'PrjShowCtrl'
    }).
        otherwise({
#      templateUrl: '../templates/home.html',
#      controller: 'HomeCtrl'
      templateUrl: '../templates/login/index.html',
      controller: 'LoginIndexCtrl'
    })
])

@todo.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
@todo.run ['$rootScope', ($rootScope) ->
  $rootScope.setCurrUser = () ->
    $http.get('./user/current.json').success((data) ->
      $rootScope.current_user = data
    )
]


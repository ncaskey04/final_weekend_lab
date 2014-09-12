# Define App and dependencies
ToDosApp = angular.module("ToDosApp", ["ngRoute", "templates"])

# Setup the angular router
ToDosApp.config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'index.html'
      controller: 'ToDosCtrl'
    .otherwise
      redirectTo: '/'

  $locationProvider.html5Mode(true)
]

# ToDosApp Controller
ToDosApp.controller "ToDosCtrl", ["$scope", "$http", ($scope, $http) ->
  $scope.ToDosApp = []
]


# Define Config for CSRF token
BookApp.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
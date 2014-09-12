# Define App and dependencies
GamesApp = angular.module("GamesApp", ["ngRoute", "templates"])

# Setup the angular router
GamesApp.config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'index.html'
      controller: 'GamesCtrl'
    .otherwise
      redirectTo: '/'

  $locationProvider.html5Mode(true)
]

# GamesApp Controller
GamesApp.controller "GamesCtrl", ["$scope", "$http", ($scope, $http) ->
  $scope.GamesApp = []






# Define Config for CSRF token
GamesApp.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
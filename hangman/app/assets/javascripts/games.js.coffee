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
  # GENERATE LETTER BUTTONS
  $scope.alphabet = "abcdefghijklmnopqrstuvwxyz".split("")

  $scope.words = []

  $scope.hideButton = (letter) ->
    this.checked = true

  # CREATE SECRET WORD & SAVE IT TO WORDS ARRAY 
  $scope.saveWord = ->
    $http.post('/words.json', $scope.secretWord).success (data) ->
      $scope.secretWord = {}
      $scope.words.push(data)
]





# Define Config for CSRF token
GamesApp.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
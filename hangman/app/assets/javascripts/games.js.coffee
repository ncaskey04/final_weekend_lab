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
  $scope.dashes = []
  $scope.guesses = []

  $scope.hideButton = (letter) ->
    this.checked = true

  $scope.hideWord = (word) ->
    this.selected = true

  $scope.addWord =() ->
    $scope.letters = $scope.secretWord.split("")
    console.log($scope.letters)
    $scope.secretWord = {}
    for x in $scope.letters
      $scope.dashes.push("_")
      console.log($scope.dashes)

  # CREATE USER GUESS AND SAVE IT TO GUESSES ARRAY
  $scope.addGuess = ->
      $scope.guess = {}
      $scope.guesses.push(guess)
]





# Define Config for CSRF token
GamesApp.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
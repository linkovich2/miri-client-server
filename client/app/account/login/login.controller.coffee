'use strict'

angular.module 'miriClientServerApp'
.controller 'LoginCtrl', ($scope, Auth, $state) ->
  $scope.user = {}
  $scope.errors = {}
  $scope.login = (form) ->
    $scope.submitted = true

    if form.$valid
      # Logged in, redirect to home
      Auth.login
        email: $scope.user.email
        password: $scope.user.password

      .then ->
        $state.go "main.connect"

      .catch (err) ->
        $scope.errors.other = err.message

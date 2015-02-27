var PizzaControllers = angular.module('PizzaControllers', []);

PizzaControllers.factory('LoginFact', function ($rootScope) {
    var user = {};
    user.id = 0;
    user.setId = function (id) {
        this.id = id;
        $rootScope.$broadcast('changedUserId');
    };
    user.getId = function () {
        return this.id;
    };
    return user;
});

PizzaControllers.controller('MenuController', ['$scope', 'LoginFact', function ($scope, LoginFact) {
    $scope.userId;
    $scope.func = function(){
        $scope.userId = LoginFact.getId();
        console.log("MenuController");
    }
    $scope.$on('changedUserId', function () {
        console.log("changed MenuController");
        $scope.userId = LoginFact.getId();
    });
    $scope.signOut = function () {
        LoginFact.setId(0);
    };
    $scope.func();
}]);


PizzaControllers.controller('PizzaListController', ['$scope', '$http', 'Pizzas', 'LoginFact', function ($scope, $http, Pizzas, LoginFact) {
    var pizzas = [];
    $scope.userId = LoginFact.getId();
    $scope.success = '';
    $scope.pizzasCount = 1;
    $scope.amount = 0;
    $scope.pages = 0;
    Pizzas.query(function (blocks) {
        var ListPizza = [];
        angular.forEach(blocks, function (block) {
            ListPizza.push(block);
            $scope.amount++;
        });
        $scope.pizzas = ListPizza;
        $scope.pages = Math.floor($scope.amount/5)+1;
    });    
    $scope.Order = function (pizzaId, userId) {
        var amount = prompt("Please enter amount", "1");
        while (amount < 1) {
            amount = prompt("Please enter amount", "1");
        }
        $http.get(href = 'http://localhost:53443/Service/Service1.svc/AddOrder?id_user=' + userId + '&id_pizza=' + pizzaId + '&amount=' + amount).
        success(function (data, status, headers, config) {
            $scope.success = "Pizza was added!";
        }).error(function (data, status, headers, config) {
            window.alert("Sorry, sometning goes wrong! Please, try again later");
        });
    };
    $scope.$on('changedUserId', function () {
        console.log("changed PizzaListController");
        $scope.userId = LoginFact.getId();
    });
}]);

PizzaControllers.controller('CartController', ['$scope', '$http', 'LoginFact', function ($scope, $http, LoginFact) {
    $scope.userId = LoginFact.getId();
    var orders = [];
    $scope.Cart = function () {
        console.log("START");
        $http.get(href = 'http://localhost:53443/Service/Service1.svc/GetMyOrders?id=' + $scope.userId).
        success(function (data, status, headers, config) {
            var ListPizza = [];
            angular.forEach(data, function (block) {
                ListPizza.push(block);
            });
            $scope.orders = ListPizza;
        }).error(function (data, status, headers, config) {
            window.alert("Sorry, sometning goes wrong! Please, try again later");
        });
    };
    $scope.$on('changedUserId', function () {
        console.log("changed CartController");
        $scope.userId = LoginFact.getId();
    });
    $scope.Cart();
}]);

PizzaControllers.controller('LoginController', ['$scope', '$http', 'LoginFact', function ($scope, $http, LoginFact) {
    $scope.userId = LoginFact.getId();
    $scope.userName;
    $scope.password;
    $scope.go = function () {
        $http.get(href = 'http://localhost:53443/Service/Service1.svc/Login?userName='+$scope.userName+'&pass='+$scope.password).
        success(function (data, status, headers, config) {
            if (data == 0) {
                window.alert("No such User");
            } else {
                LoginFact.setId(data);
                $scope.userId = LoginFact.getId();
            };
        }).error(function (data, status, headers, config) {
            window.alert("Sorry, sometning goes wrong! Please, try again later");            
        });
    }
    $scope.$on('changedUserId', function () {
        console.log("changed LoginController");
        $scope.userId = LoginFact.getId();
    });
}]);
var mainApp = angular.module('mainApp', ['ngRoute', 'ngAnimate', 'PizzaControllers', 'pizzasServices']);

mainApp.config([
    '$routeProvider',
    function ($routeProvider) {
        $routeProvider.when('/pizza', {
            templateUrl: 'Views/list.html',
            controller: 'PizzaListController'
        }).when('/cart', {
            templateUrl: 'Views/cart.html',
            controller: 'CartController'
        }).when('/login', {
            templateUrl: 'Views/login.html',
            controller: 'LoginController'
        }).otherwise({
            redirectTo: '/login'
        });
    }
]);

mainApp.filter('filterAndReduce', function () {
    return function (pizzas, page, query) {
        var onPage = 5;
        if (!query) {
            return pizzas.slice((page-1)*onPage, page*onPage);
        }
        var filtered = [];
        query = query.toLowerCase();
        angular.forEach(pizzas, function (pizza) {
            if (pizza.name.toLowerCase().indexOf(query) !== -1) {
                filtered.push(pizza);
            }
        });
        return filtered;
    };
});

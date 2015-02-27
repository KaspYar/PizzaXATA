var pizzasServices = angular.module('pizzasServices', ['ngResource']);

pizzasServices.factory('Pizzas', ['$resource',
    function ($resource) {
        return $resource('../../Service/Service1.svc/GetPizza', {}, {
            query: { method: 'GET', params: {}, isArray: true }
        });
    }]);

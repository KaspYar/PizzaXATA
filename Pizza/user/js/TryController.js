var PizzaController = function ($scope) {
    $scope.arrPizza = [];

    function setTasksByStatus(arrPizza) {
        for (var i = 0; i < arrPizza.length; i++) {
            $scope.$apply(function () { $scope.arrPizza.push(arrPizza[i]) });
        }
    }

    function ajaxGetTasks(callback) {
        $.ajax({
            type: 'get',
            url: '../../Service/Service1.svc/GetPizza',
            dataType: 'json',
            success: function (jqXHR) {
                console.log(jqXHR);

                if (jqXHR != null) {
                    if (callback && typeof (callback) === "function") {
                        callback(jqXHR);
                    }
                }
            },
            error: function (data, textStatus, errorThrown) {
                console.error("ERROR getting tasks", this, data, textStatus, errorThrown);
            }
        });
    }

    ajaxGetTasks(function (jqXHR) {
        setTasksByStatus(jqXHR);
    });

};
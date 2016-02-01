<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
.glyphicon-heart {
  position: relative;
  top: -15px;
  color: red;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.1/angular.min.js"></script>  
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script type="text/javascript">
angular.module("myApp", [])
.filter('fromTo', function() {
    return function(input, from, total, lessThan) {
        from = parseInt(from);
        total = parseInt(total);
        for (var i = from; i < from + total && i < lessThan; i++) {
            input.push(i);
        }
        return input;
    }
})
.factory('instagram', ['$http',
    function($http) {
        return {
            fetchPopular: function(callback) {

                var endPoint = "https://api.instagram.com/v1/media/popular?client_id=642176ece1e7445e99244cec26f4de1f&callback=JSON_CALLBACK";

                $http.jsonp(endPoint).success(function(response) {
                    callback(response.data);
                });
            }
        }
    }
])
.controller("Example", function($scope, $interval, instagram) {
  $scope.pics = [];
  $scope.have = [];
  $scope.orderBy = "-likes.count";
  $scope.getMore = function() {
    instagram.fetchPopular(function(data) {
        for(var i=0; i<data.length; i++) {
          if (typeof $scope.have[data[i].id]==="undefined") {
            $scope.pics.push(data[i]) ;
            $scope.have[data[i].id] = "1";
          }
        }
    });
  };
  $scope.getMore();
  
    $scope.tags = [
        'Bootstrap', 'AngularJS', 'Instagram', 'Factory'
    ]
});

</script>
</head>

<body>
<div class="container" ng-app="myApp" ng-controller="Example">
    <div class="container">
      <div class="row">
        <div class="col-md-12"><h1>인스타그램 인기사진 보기 <button type="button" class="btn btn-success" ng-click="getMore()">현재 {{pics.length}}장의 사진이 있습니다. - 더 보기</button></h1></div>
      </div>
        <div class="row">
		<div ng-repeat="p in pics | orderBy:orderBy" class="col-md-2">
			<a href="{{p.link}}" target="_blank"><img ng-src="{{p.images.low_resolution.url}}" class="img-responsive thumbnail" title="{{p.caption.text}}"></a>
<span class="glyphicon glyphicon-heart"> {{p.likes.count}}</span>      
        </div>
    </div>
   
</div>
  
</div>
</body>
</html>
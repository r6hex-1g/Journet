// 맵 기본 설정
var mapContainer = document.getElementById('map');
var Center = new kakao.maps.LatLng(36.6364883, 127.4836014);
var options = {
  center: Center,
  level: 7
};

var map = new kakao.maps.Map(mapContainer, options);

// 마커 설정
var markerPosition = new kakao.maps.LatLng(36.6350699, 127.4577795);
var marker = new kakao.maps.Marker({
  position: markerPosition,
  map: map
});

// 마우스 클릭 이벤트 설정
kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
  var latlng = mouseEvent.latLng;
  marker.setPosition(latlng);
});

// 맵 세부 설정
map.setMaxLevel(7, { animate: true });
map.setZoomable(true);
map.setDraggable(true);

// 맵 축척 조절 바 생성
var control = new kakao.maps.ZoomControl();
map.addControl(control, kakao.maps.ControlPosition.BOTTOMRIGHT);
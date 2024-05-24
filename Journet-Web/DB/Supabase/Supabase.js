// import { Database } from './database.types';
// supabase 기본 설정
const supabase_url = "https://kimtuecthichjtenslli.supabase.co";
const supabase_key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtpbXR1ZWN0aGljaGp0ZW5zbGxpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTUxMzAxNTAsImV4cCI6MjAzMDcwNjE1MH0.i8gRNNi684LbanM6Ibxf-rcA5Q5ekcxhX53IHd_53HI";

const client = supabase.createClient(
  supabase_url, supabase_key
);

// 맵 기본 설정
var mapContainer = document.getElementById('map');
var Center = new kakao.maps.LatLng(36.6364883, 127.4836014);
var options = {
  center: Center,
  level: 14
};
let map = new kakao.maps.Map(mapContainer, options);

// 맵 클러스터 설정
var clusterer = new kakao.maps.MarkerClusterer({
  map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
  averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
  minLevel: 10 // 클러스터 할 최소 지도 레벨 
});

// 맵 세부 설정
// map.setMaxLevel(7, { animate: true });
map.setZoomable(true);
map.setDraggable(true);

// 맵 축척 조절 바 생성
var control = new kakao.maps.ZoomControl();
map.addControl(control, kakao.maps.ControlPosition.BOTTOMRIGHT);

// 마우스 클릭 이벤트 설정 - 점검 예정
// kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
//   var latlng = mouseEvent.latLng;
// });

// 생성자 함수 => 객체 > 배열
let map_pin = [];

// DB 로딩하기
async function refrash_mappins() {

  let { data: pins, error } = await client.from("Mappins").select("*");
  console.log('pins', pins);

  function DB_pin(title, lat, lng) {
    this.title = title;
    this.latlng = new kakao.maps.LatLng(lat, lng);
    this.building = function () {
      return title;
    };
  };

  for (let pin of pins) {
    let db_pin = new DB_pin(pin.building_name, pin.latitude, pin.longitude);
    map_pin.push(db_pin);
  }

  for (let all_pin of map_pin) {
    // 마커 찍기
    var marker = new kakao.maps.Marker({
      map: map,
      position: all_pin.latlng
    });

    // console.log(marker);
    // clusterer.addMarkers(marker.n);
  }
}
refrash_mappins();